//
//  mergContact.mm
//  mergContact
//
//  Created by Monte Goulding on 4/11/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#include <Foundation/Foundation.h>
#include <AddressBook/AddressBook.h>
#include <UIKit/UIKit.h>

NSData * mergContactImage (ABRecordID pContactID, ABPersonImageFormat pImageType)
{
    ABAddressBookRef t_addressBook = ABAddressBookCreate();
    ABRecordRef t_person = ABAddressBookGetPersonWithRecordID(t_addressBook, pContactID);
   // Check for contact picture
    if (t_person != nil && ABPersonHasImageData(t_person)) {
        if ( &ABPersonCopyImageDataWithFormat != nil ) {
            // iOS >= 4.1
            return (NSData *)ABPersonCopyImageDataWithFormat(t_person, pImageType);
        } else {
            // iOS < 4.1
            return (NSData *)ABPersonCopyImageData(t_person);
        }
    } else {
        return nil;
    }
}