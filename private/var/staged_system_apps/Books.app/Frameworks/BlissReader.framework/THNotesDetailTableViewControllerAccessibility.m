@implementation THNotesDetailTableViewControllerAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("THNotesDetailTableViewController");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)THNotesDetailTableViewControllerAccessibility;
  -[THNotesDetailTableViewControllerAccessibility tableView:didSelectRowAtIndexPath:](&v5, "tableView:didSelectRowAtIndexPath:", a3, a4);
  if (-[THNotesDetailTableViewControllerAccessibility _thaxIsEditing](self, "_thaxIsEditing"))
    -[THNotesDetailTableViewControllerAccessibility _thaxAnnounceNumberOfSelectedNotes](self, "_thaxAnnounceNumberOfSelectedNotes");
}

- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)THNotesDetailTableViewControllerAccessibility;
  -[THNotesDetailTableViewControllerAccessibility tableView:didDeselectRowAtIndexPath:](&v5, "tableView:didDeselectRowAtIndexPath:", a3, a4);
  if (-[THNotesDetailTableViewControllerAccessibility _thaxIsEditing](self, "_thaxIsEditing"))
    -[THNotesDetailTableViewControllerAccessibility _thaxAnnounceNumberOfSelectedNotes](self, "_thaxAnnounceNumberOfSelectedNotes");
}

- (void)notesDetailTableViewHeaderView:(id)a3 selected:(BOOL)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)THNotesDetailTableViewControllerAccessibility;
  -[THNotesDetailTableViewControllerAccessibility notesDetailTableViewHeaderView:selected:](&v5, "notesDetailTableViewHeaderView:selected:", a3, a4);
  if (-[THNotesDetailTableViewControllerAccessibility _thaxIsEditing](self, "_thaxIsEditing"))
    -[THNotesDetailTableViewControllerAccessibility _thaxAnnounceNumberOfSelectedNotes](self, "_thaxAnnounceNumberOfSelectedNotes");
}

- (BOOL)selectAllNotes
{
  BOOL v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)THNotesDetailTableViewControllerAccessibility;
  v3 = -[THNotesDetailTableViewControllerAccessibility selectAllNotes](&v5, "selectAllNotes");
  -[THNotesDetailTableViewControllerAccessibility _thaxAnnounceNumberOfSelectedNotes](self, "_thaxAnnounceNumberOfSelectedNotes");
  return v3;
}

- (void)deselectAllNotes
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THNotesDetailTableViewControllerAccessibility;
  -[THNotesDetailTableViewControllerAccessibility deselectAllNotes](&v3, "deselectAllNotes");
  -[THNotesDetailTableViewControllerAccessibility _thaxAnnounceNumberOfSelectedNotes](self, "_thaxAnnounceNumberOfSelectedNotes");
}

- (void)deleteSelectedNotes
{
  uint64_t v3;
  id v4;
  const __CFString *v5;
  objc_super v6;

  v3 = -[THNotesDetailTableViewControllerAccessibility _thaxNumberOfSelectedNotes](self, "_thaxNumberOfSelectedNotes");
  v4 = TSAccessibilityLocalizedUnsignedInteger(v3);
  v6.receiver = self;
  v6.super_class = (Class)THNotesDetailTableViewControllerAccessibility;
  -[THNotesDetailTableViewControllerAccessibility deleteSelectedNotes](&v6, "deleteSelectedNotes");
  if (v3 == 1)
    v5 = CFSTR("%@ note deleted");
  else
    v5 = CFSTR("%@ notes deleted");
  TSAccessibilityPostHighPriorityAnnouncementNotification((uint64_t)self, (uint64_t)+[NSString stringWithFormat:](NSString, "stringWithFormat:", v5, v4));
}

- (void)_thaxAnnounceNumberOfSelectedNotes
{
  uint64_t v3;
  id v4;
  const __CFString *v5;

  v3 = -[THNotesDetailTableViewControllerAccessibility _thaxNumberOfSelectedNotes](self, "_thaxNumberOfSelectedNotes");
  v4 = TSAccessibilityLocalizedUnsignedInteger(v3);
  if (v3 == 1)
    v5 = CFSTR("%@ note selected");
  else
    v5 = CFSTR("%@ notes selected");
  TSAccessibilityPostHighPriorityAnnouncementNotification((uint64_t)self, (uint64_t)+[NSString stringWithFormat:](NSString, "stringWithFormat:", v5, v4));
}

- (BOOL)_thaxIsEditing
{
  return -[UITableView isEditing](-[THNotesDetailTableViewControllerAccessibility _thaxTableView](self, "_thaxTableView"), "isEditing");
}

- (UITableView)_thaxTableView
{
  objc_class *v3;
  UITableView *result;
  char v5;

  v5 = 0;
  v3 = (objc_class *)objc_opt_class(UITableView);
  result = (UITableView *)__TSAccessibilityCastAsClass(v3, (uint64_t)-[THNotesDetailTableViewControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("tableView")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (unint64_t)_thaxNumberOfSelectedNotes
{
  return -[NSDictionary count](-[THNotesDetailTableViewControllerAccessibility _thaxSelectedNotes](self, "_thaxSelectedNotes"), "count");
}

- (NSDictionary)_thaxSelectedNotes
{
  objc_class *v3;
  NSDictionary *result;
  char v5;

  v5 = 0;
  v3 = (objc_class *)objc_opt_class(NSDictionary);
  result = (NSDictionary *)__TSAccessibilityCastAsClass(v3, (uint64_t)-[THNotesDetailTableViewControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("mSelectedNotes")), 1, &v5);
  if (v5)
    abort();
  return result;
}

@end
