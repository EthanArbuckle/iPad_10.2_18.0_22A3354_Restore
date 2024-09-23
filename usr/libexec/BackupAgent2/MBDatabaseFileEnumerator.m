@implementation MBDatabaseFileEnumerator

- (MBDatabaseFileEnumerator)initWithDecoder:(id)a3 database:(id)a4
{
  MBDatabaseFileEnumerator *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MBDatabaseFileEnumerator;
  v6 = -[MBDatabaseFileEnumerator init](&v8, "init");
  if (v6)
  {
    v6->_decoder = (MBDecoder *)a3;
    v6->_database = (MBDatabase *)a4;
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MBDatabaseFileEnumerator;
  -[MBDatabaseFileEnumerator dealloc](&v3, "dealloc");
}

- (id)nextObject
{
  unint64_t v3;

  v3 = -[MBDecoder offset](self->_decoder, "offset");
  if (v3 >= -[NSData length](-[MBDecoder data](self->_decoder, "data"), "length"))
    return 0;
  else
    return +[MBFile fileWithDecoder:database:](MBFile, "fileWithDecoder:database:", self->_decoder, self->_database);
}

@end
