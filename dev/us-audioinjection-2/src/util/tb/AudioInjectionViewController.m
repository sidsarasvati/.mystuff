//
//  AudioInjectionViewController.m
//  vivoxsdk
//
//  Created by Sid Sarasvati on 11/5/12.
//
//

#import "AudioInjectionViewController.h"

@interface AudioInjectionViewController ()

@end

@implementation AudioInjectionViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad	
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    switch ([indexPath row]) {
        case 0:
            cell.textLabel.text = @"WAV (16000)";
            break;
        case 1:
            cell.textLabel.text = @"WAV (32000)";
            break;
        case 2:
            cell.textLabel.text = @"CAF";
            break;
        case 3:
            cell.textLabel.text = @"MP3";
            break;
        default:
            break;
    }
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     [detailViewController release];
     */
    
    switch ([indexPath row]) {
            NSString *filepath;
        case 0:
            filepath = [[NSBundle mainBundle] pathForResource:@"wav300-16000" ofType:@"wav"];
            [[TBCallMgr getInstance] injectAudioStart:(filepath)];
            break;
        case 1:
            filepath = [[NSBundle mainBundle] pathForResource:@"wav300-32000" ofType:@"wav"];
            [[TBCallMgr getInstance] injectAudioStart:(filepath)];
            break;
        case 2:
            filepath = [[NSBundle mainBundle] pathForResource:@"caf15" ofType:@"caf"];
            [[TBCallMgr getInstance] injectAudioStart:(filepath)];
            break;
        case 3:
            filepath = [[NSBundle mainBundle] pathForResource:@"mp3300" ofType:@"mp3"];
            [[TBCallMgr getInstance] injectAudioStart:(filepath)];
            break;
        default:
            break;
    }
    //pop up last view from stack 
    [self.navigationController popViewControllerAnimated:YES];
}

@end
