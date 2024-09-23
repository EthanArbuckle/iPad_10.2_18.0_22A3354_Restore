@implementation SearchDebugViewController

+ (id)navigationDestinationTitle
{
  return CFSTR("Search Completions");
}

- (void)prepareContent
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;

  v3 = -[MapsDebugValuesViewController addSectionWithTitle:content:](self, "addSectionWithTitle:content:", CFSTR("Address Book"), &stru_1011C6FA0);
  v4 = -[MapsDebugValuesViewController addSectionWithTitle:content:](self, "addSectionWithTitle:content:", CFSTR("Recents"), &stru_1011C6FC0);
  v5 = -[MapsDebugValuesViewController addSectionWithTitle:content:](self, "addSectionWithTitle:content:", CFSTR("History & Bookmarks"), &stru_1011C6FE0);
  v6 = -[MapsDebugValuesViewController addSectionWithTitle:content:](self, "addSectionWithTitle:content:", CFSTR("Search Requests"), &stru_1011C7000);
  v7 = -[MapsDebugValuesViewController addSectionWithTitle:content:](self, "addSectionWithTitle:content:", 0, &stru_1011C7020);
}

@end
