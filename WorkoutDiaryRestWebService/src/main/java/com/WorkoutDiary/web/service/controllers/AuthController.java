package com.WorkoutDiary.web.service.controllers;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.xmldb.api.DatabaseManager;
import org.xmldb.api.base.Collection;
import org.xmldb.api.base.Resource;
import org.xmldb.api.base.ResourceIterator;
import org.xmldb.api.base.ResourceSet;
import org.xmldb.api.base.XMLDBException;
import org.xmldb.api.modules.XPathQueryService;

import com.WorkoutDiary.web.service.Config;
import com.WorkoutDiary.web.service.models.*;

@RestController
@RequestMapping("/service/auth") 
public class AuthController {
    @RequestMapping("/login")
    public boolean login(@RequestParam(value="userID") String name, @RequestParam(value="authMethod") AuthMethods method) throws XMLDBException {
    	Collection col = DatabaseManager.getCollection(Config.DatabaseURI);
        XPathQueryService xpqs = (XPathQueryService)col.getService("XPathQueryService", "1.0");
        xpqs.setProperty("indent", "yes");
        xpqs.setNamespace("", "http://workout-diary.com");
        ResourceSet result = xpqs.query("doc('/db/apps/WorkoutDiary/WorkoutDiaryDatabase.xml')/database/users");
        ResourceIterator i = result.getIterator();
        Resource res = null;
        while(i.hasMoreResources()) {
	        res = i.nextResource();
	        System.out.println(res.getContent());
        }
        return true;
    }
}
