NSString-RemoteControl
======================

NSString Category to easily control some strings value on server side.


Install
--

Add the sources files (```NSString+RemoteControl.h``` and ```NSString+RemoteControl.m```) in your project

Usage
--
Import the ```NSString+RemoteControl.h``` file.

```
[@"My remotable string" remoteControlled] 
```

```
[@"My remotable string with a key" remoteControlKey:@"MY_KEY"] 
```


Ping the JSON file or JSON webservice that will return the remote key/value of a remote controlled string (for example in the - (void)applicationDidBecomeActive: method)

```
[NSString syncRemoteControlledStringsWithURL:@"YOUR_URL/demo.json" completion:^(id JSON, NSError *error) {
       //Do something if needed
    }];
```

If you want to change the value of the NSString above just add JSON file with the key/value you want to change

```
{"My remotable string":"Here is a new value","MY_KEY":"And here a new value based on a key"}
```

Credits
--

Web: [mcmurrich.fr][1]  
Twitter: [@ben_mcm][2]  
Facebook: [facebook.com/benjamin.mcmurrich][3]  
  
  [1]: http://www.mcmurrich.fr "mcmurrich.fr"
  [2]: http://twitter.com/ben_mcm "Ben on Twitter"
  [3]: http://www.facebook.com/benjamin.mcmurrich "Ben on Facebook"
