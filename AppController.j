/*
 * AppController.j
 * upload-demo
 *
 * Created by Aparajita Fishman on February 3, 2013.
 * Copyright 2013, Filmworkers Club. All rights reserved.
 */

@import <Foundation/CPObject.j>
@import <AppKit/CPAlert.j>
@import <AppKit/CPUserDefaultsController.j>

@import <Cup/Cup.j>
@import <Cup/CupByteCountTransformer.j>


@implementation AppController : CPObject
{
    @outlet CPWindow    theWindow;
    @outlet Cup         uploader1;
    @outlet Cup         uploader2;

    BOOL                logging @accessors;
}

- (void)applicationDidFinishLaunching:(CPNotification)aNotification
{
}

- (BOOL)cup:(Cup)aCup willAddFile:(CupFile)aFile
{
    if (logging)
        console.log("%s %s", _cmd, [aFile description]);

    return YES;
}

- (void)cup:(Cup)aCup didAddFile:(CupFile)aFile
{
    if (logging)
        console.log("%s %s", _cmd, [aFile description]);
}

- (BOOL)cup:(Cup)aCup willSubmitFile:(CupFile)aFile
{
    if (logging)
        console.log("%s %s", _cmd, [aFile description]);

    return YES;
}

- (BOOL)cup:(Cup)aCup willSendFile:(CupFile)aFile
{
    if (logging)
        console.log("%s %s", _cmd, [aFile description]);

    return YES;
}

- (void)cup:(Cup)aCup uploadDidSucceedForFile:(CupFile)aFile
{
    if (logging)
        console.log("%s %s", _cmd, [aFile description]);
}

- (void)cup:(Cup)aCup uploadDidFailForFile:(CupFile)aFile
{
    if (logging)
        console.log("%s %s", _cmd, [aFile description]);
}

- (void)cup:(Cup)aCup uploadDidCompleteForFile:(CupFile)aFile
{
    if (logging)
        console.log("%s %s", _cmd, [aFile description]);
}

- (void)cup:(Cup)aCup uploadWasStoppedForFile:(CupFile)aFile
{
    if (logging)
        console.log("%s %s", _cmd, [aFile description]);

    [[CPAlert alertWithMessageText:[CPString stringWithFormat:@"Transfer of “%@” has been stopped.", [aFile name]]
                     defaultButton:@"OK"
                   alternateButton:nil
                       otherButton:nil
         informativeTextWithFormat:@""] runModal];
}

- (void)cup:(Cup)aCup uploadForFile:(CupFile)aFile didProgress:(JSObject)progress
{
    if (logging)
        console.log("%s %s: %s", _cmd, [aFile description], CPDescriptionOfObject(progress));
}

- (void)cup:(Cup)aCup uploadsDidProgress:(JSObject)progress
{
    if (logging)
        console.log("%s %s", _cmd, CPDescriptionOfObject(progress));
}

- (void)cupDidStart:(Cup)aCup
{
    if (logging)
        console.log("%s", _cmd);
}

- (void)cupDidStop:(Cup)aCup
{
    if (logging)
        console.log("%s", _cmd);
}

- (void)cupDidStartQueue:(Cup)aCup
{
    if (logging)
        console.log("%s", _cmd);
}

- (void)cupDidClearQueue:(Cup)aCup
{
    if (logging)
        console.log("%s", _cmd);
}

- (void)cupDidStopQueue:(Cup)aCup
{
    if (logging)
        console.log("%s", _cmd);
}

- (void)cup:(Cup)aCup fileInputDidSelectFiles:(CPArray)files
{
    if (logging)
        console.log("%s %s", _cmd, [files description]);
}

- (void)cup:(Cup)aCup didPasteFiles:(CPArray)files
{
    if (logging)
        console.log("%s %s", _cmd, [files description]);
}

- (void)cup:(Cup)aCup didDropFiles:(CPArray)files
{
    if (logging)
        console.log("%s %s", _cmd, [files description]);
}

- (void)cup:(Cup)aCup wasDraggedOverWithEvent:(jQueryEvent)anEvent
{
    if (logging)
        console.log("%s %o", _cmd, anEvent);
}

- (BOOL)cup:(Cup)aCup willSendChunkForFile:(CupFile)aFile
{
    if (logging)
        console.log("%s %s", _cmd, [aFile description]);

    return YES;
}

- (void)cup:(Cup)aCup chunkDidSucceedForFile:(CupFile)aFile
{
    if (logging)
        console.log("%s %s", _cmd, [aFile description]);
}

- (void)cup:(Cup)aCup chunkDidFailForFile:(CupFile)aFile
{
    if (logging)
        console.log("%s %s", _cmd, [aFile description]);
}

- (void)cup:(Cup)aCup chunkDidCompleteForFile:(CupFile)aFile
{
    if (logging)
        console.log("%s %s", _cmd, [aFile description]);
}

@end


@implementation DoneNumberFormatter : CPNumberFormatter

- (CPString)stringFromNumber:(CPNumber)number
{
    return number >= 100 ? @"Done!" : number + @"%";
}

@end
