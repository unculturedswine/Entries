Entries
=======

##Objectives
Learn basics of a custom model object used for data storage, and a singleton controller to manage that those objects.

##Part 1:

###Step 1: Create an Entry Object
- Create an Entry with properties:
  - Title (NSString strong)
  - Text (NSString strong)
  - Timestamp (NSDate strong)

###Step 2: Add Dictionary Representations of Entries
- Add two methods to the header of Entry
  - -(NSDictionary *)entryDictionary
  - -(id)initWithDictionary:(NSDictionary *)dictionary
- Add the methods to the implementation file
- Add a const key for each of the properties (i.e. titleKey, textKey)
- In the dictionary method create a mutable dictionary and then add each of the properties for their key
  - Note: You can't insert a nil object. So you'll want to check those objects before you add them
  - if (title != nil) { [dictionary addObject:title forKey:titleKey] }
- In the init method you'll set the properties to the values for keys from the dictionary

###Step 3: Add methods to store and retrieve Entries from NSUserDefaults
- Add two methods to the header of Entry
  - + (NSMutableArray *)loadEntriesFromDefaults
  - + (void)storeEntriesInDefaults:(NSArray *)entries
- Add the methods to the implementation file
  - For the loadFromDefaults you'll have 4 steps
    - Get the entryDictionaries from NSUserDefaults for the entryListKey
    - Create a mutable array called entries
    - Iterate through (for loop) the dictionaries in entryDictionaries and for each dictionary intialize an entry and put that entry in the mutable entries array
    - Return the mutable array
  - For the storeEntriesInDefaults method you'll have 3 steps
    - Create a mutable array called entryDictionaries
    - Iterate through (for loop) the entries passed in and for each entry add the dictionary representation to entryDictionaries
    - Save entryDictionaries to NSUserDefaults for the entryListKey

###Notes: Testing progress
*You can test your progress in the AppDelegate didFinishLaunching method by 1) retrieving the entries, 2) initializing a new entry with a dictionary, 3) adding it to the entries you retrieved, and then 4) storing the new array of entries. Then if you quit and launch the app there should be a new entry in the list that is retrieved from persistance.*


##Part 2:

###Step 4: Create an EntryController Object
- Create an EntryController with property:
  - Entries (NSArray strong, readonly)
- And methods:
  - + (EntryController *)sharedInstance
  - - (void)addEntry:(Entry *)entry
  - - (void)removeEntry:(Entry *)entry
  
The shared instance method should be defined to match the gist here:
https://gist.github.com/jkhowland/89e24b5fb6e1b5048eb5

The addEntry method needs to create a mutable version of the controller's entries array, add the entry that's passed in, and then re-set the controller's Entries array.

The removeEntry method needs to do the reverse. It should create a mutable copy of the entries array, remove the entry that was passed in, and then re-set the controllers Entries array.

Note: Pointers. Because the entities stored in the array are mutable objects, we can change them and they will update inside the array. So we don't need any method for changing an entry.

###Step 5: Update the controller to retrieve and store it's array from NSUserDefaults
- Move the loadEntriesFromDefaults method to the controller class  
  - In the sharedInstance method set sharedInstance.entries to [self loadEntriesFromDefaults]
- Move the storeEntriesInDefaults: method to the controller class
  - You can call this in two ways. You can:
    - In the setter method of entries call storeEntriesInDefaults and pass in the new entries array
    - Make sure that addEntry and removeEntry are setting self.entries at the end of the methods

###Notes: Testing completion
*You can test completion in the AppDelegate didFinishLaunching method by 1) retrieving the entry count, 2) Initalizing and entry and setting it's properties, and 3) adding that entry to the entry controller. Then if you quit and launch the app there should be a new entry in the list that is retrieved from persistance.*

## Code Bank

At this point you will have sample code of object and controller classes that you can reuse.
