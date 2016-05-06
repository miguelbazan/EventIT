//
//  EventTableViewController.swift
//  Event it
//
//  Created by Luis Felipe Salazar on 10/10/15.
//  Copyright © 2015 Luis Felipe Salazar. All rights reserved.
//

import UIKit

class EventTableViewController: UITableViewController, UISearchBarDelegate {

    @IBOutlet var tableEvents: UITableView!
    
    @IBOutlet weak var eventsSearchBar: UISearchBar!
    
    var searchActive : Bool = false
    //var data = ["San Francisco","New York","San Jose","Chicago","Los Angeles","Austin","Seattle"]
    var filtered:[String] = []
    
    var eventos:[NSArray] = []
    var cuentas:[NSArray] = []
    
    var idEventos = [1, 2]
    var nombreEventos = ["Epic Hack", "Area"]
    var lugarEventos = [" Avenida Ignacio Morones Prieto 4500 Pte.,Jesús M. Garza,66238 San Pedro Garza García, N.L.", " RECINTO GRAND #2411 Ave. Eugenio Garza Sada 2411, dentro de Paseo Tec Col. Roma, Monterrey, N.L."]
    var latitudeEventos = [25.663883, 25.655018]
    var longitudeEventos = [-100.419892, -100.293282]
    var descripcionEventos = ["Te invitamos a participar a la primera edición de Epic Hack realizado en la Universidad de Monterrey, en esta ocasión queremos romper estereotipos, normalmente a un Hackathon asisten solo personas relacionadas a una carrera de TI, nosotros creemos que una carrera no determina un talento, así que si tienes una idea de proyecto pero no sabes nada de programación no te preocupes, estas en el lugar indicado. El Epic Hack se llevará a cabo los días 10 y 11 de octubre del presente año, con una duración de 30 horas. Este evento estará lleno de sorpresas, comenzaremos con un chapter en donde dos lideres en tecnología nos inspiraran a crear nuestros sueños, después tendremos 24 horas continuas de hacking e innovación, comida y convivencia con personas increíbles y por si fuera poco hasta te retaremos en una competencia de videojuegos", "Es el espacio para profesionistas, estudiantes y emprendedores de medios interactivos y creativos.\n\nJOIN\nEl evento es una permanente invitación a ser parte de la comunidad e involucrarse de manera activa participando en colaboración con el resto de los asistentes.\n\nFIND\nA través de cada actividad proporcionamos herramientas que impulsan la innovación y despiertan el deseo de descubrimiento\n\nGO\n“Call to action” con el que reconocemos a los asistentes como agentes de innovación y los enviamos a obtener nuevos y mejores resultados."]
    var imagenEvento = ["epicHack", "area"]
    var fechasEvento = ["10 y 11 de Octubre","23 y 24 de Octubre"]
    var costoEvento = [0, 450]
    
    var nombre = "Nombre"
    var lugar = "Lugar del evento"
    var location = "location"
    var descripcion = "Descripcion"
    var imagen = "nombre de la imagen"
    var fecha = "fecha evento"
    var costo = 0
    var latitude = 25.663883
    var longitude = -100.419892

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        tableEvents.delegate = self
        tableEvents.dataSource = self
        eventsSearchBar.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if(searchActive) {
            return filtered.count
        }
        return nombreEventos.count
        
    }
    
    //Search functions
    func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
        searchActive = true;
        eventsSearchBar.showsCancelButton = true
    }
    
    func searchBarTextDidEndEditing(searchBar: UISearchBar) {
        searchActive = false;
        eventsSearchBar.showsCancelButton = false
        self.view.endEditing(true)
    }
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        searchActive = false;
        eventsSearchBar.showsCancelButton = false
        self.view.endEditing(true)
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        searchActive = false;
        eventsSearchBar.showsCancelButton = false
        
        self.view.endEditing(true)
    }
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        
        filtered = nombreEventos.filter({ (text) -> Bool in
            let tmp: NSString = text
            let range = tmp.rangeOfString(searchText, options: NSStringCompareOptions.CaseInsensitiveSearch)
            return range.location != NSNotFound
        })
        if(filtered.count == 0){
            searchActive = false;
        } else {
            searchActive = true;
        }
        self.tableView.reloadData()
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        
        if(searchActive){
            cell.textLabel?.text = filtered[indexPath.row]
            cell.imageView?.image = UIImage(named: imagenEvento[indexPath.row] + "S")
        } else {
            cell.imageView?.image = UIImage(named: imagenEvento[indexPath.row] + "S")
            cell.textLabel?.text = nombreEventos[indexPath.row]
            cell.textLabel?.font = UIFont(name: (cell.textLabel?.font.fontName)!, size: 20)
        
        }

        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let row = indexPath.row
        
      
        nombre = nombreEventos[row]
        lugar = lugarEventos[row]
        latitude = latitudeEventos[row]
        longitude = longitudeEventos[row]
        descripcion = descripcionEventos[row]
        imagen = imagenEvento[row]
        fecha = fechasEvento[row]
        costo = 0

        self.performSegueWithIdentifier("eventSegue", sender: self)
    }

    
    override func shouldAutorotate() -> Bool {
        if (UIDevice.currentDevice().orientation == UIDeviceOrientation.Portrait ||
            UIDevice.currentDevice().orientation == UIDeviceOrientation.PortraitUpsideDown) {
                return true
        }
        else {
            return false
        }
    }
    

    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        let orientations = UIInterfaceOrientationMask.Portrait
        
        return (UIInterfaceOrientationMask.Portrait)
        
        
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "eventSegue"){
            //Pass Album and Title to next View
            let controller: EventoViewController = segue.destinationViewController as! EventoViewController
            controller.nombre = nombre
            controller.lugar = lugar
            //controller.location = location
            controller.latitude = latitude
            controller.longitude = longitude
            controller.descripcion = descripcion
            controller.imagen = imagen
            controller.fecha = fecha
            controller.costo = costo
        }
    }

}
