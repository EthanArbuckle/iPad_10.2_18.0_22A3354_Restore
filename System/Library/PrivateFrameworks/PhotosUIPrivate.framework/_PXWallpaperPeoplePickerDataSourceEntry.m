@implementation _PXWallpaperPeoplePickerDataSourceEntry

- (NSArray)persons
{
  return self->_persons;
}

- (void)setPersons:(id)a3
{
  objc_storeStrong((id *)&self->_persons, a3);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_persons, 0);
}

@end
