/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package restaruante.cliente;

import restaurantem.adminitrador.*;
import java.awt.Desktop;
import java.net.URI;
import javax.swing.JOptionPane;

/**
 *
 * @author arahiza
 */
public class accederInternet {
    public void acceder(){
        String url="http://localhost/restaurantepagina/";

        try {
            Desktop.getDesktop().browse(URI.create(url));
        } catch (Exception e) {
            e.printStackTrace();   
        JOptionPane.showMessageDialog(null, "error de conexion "+e);
        }
    }
}
