@implementation MBDatabaseIndex

+ (unint64_t)flagsForMode:(unsigned __int16)a3
{
  int v3;
  unint64_t v4;
  uint64_t v5;

  v3 = a3 & 0xF000;
  v4 = 1;
  v5 = 2;
  if (v3 != 0x4000)
    v5 = 0;
  if (v3 != 0x8000)
    v4 = v5;
  if (v3 == 40960)
    return 4;
  else
    return v4;
}

+ (id)databaseIndex
{
  return objc_alloc_init(MBDatabaseIndex);
}

- (MBDatabaseIndex)init
{
  MBDatabaseIndex *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MBDatabaseIndex;
  v2 = -[MBDatabaseIndex init](&v4, "init");
  if (v2)
    v2->_entriesByFileID = (NSMutableDictionary *)objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", 0);
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MBDatabaseIndex;
  -[MBDatabaseIndex dealloc](&v3, "dealloc");
}

- (unint64_t)count
{
  return (unint64_t)-[NSMutableDictionary count](self->_entriesByFileID, "count");
}

- (BOOL)containsFileID:(id)a3
{
  return -[NSMutableDictionary objectForKeyedSubscript:](self->_entriesByFileID, "objectForKeyedSubscript:", a3) != 0;
}

- (int64_t)offsetForFileID:(id)a3
{
  id v3;

  v3 = -[NSMutableDictionary objectForKeyedSubscript:](self->_entriesByFileID, "objectForKeyedSubscript:", a3);
  if (v3)
    return (int64_t)objc_msgSend(v3, "offset");
  else
    return -1;
}

- (unint64_t)flagsForFileID:(id)a3
{
  unint64_t result;

  result = (unint64_t)-[NSMutableDictionary objectForKeyedSubscript:](self->_entriesByFileID, "objectForKeyedSubscript:", a3);
  if (result)
    return (unint64_t)objc_msgSend((id)result, "flags");
  return result;
}

- (unint64_t)flagsForFileID:(id)a3 error:(id *)a4
{
  return -[MBDatabaseIndex flagsForFileID:](self, "flagsForFileID:", a3, a4);
}

- (id)fileIDEnumerator
{
  return -[NSMutableDictionary keyEnumerator](self->_entriesByFileID, "keyEnumerator");
}

- (id)setFlags:(unint64_t)a3 forFileID:(id)a4
{
  id v5;

  v5 = -[NSMutableDictionary objectForKeyedSubscript:](self->_entriesByFileID, "objectForKeyedSubscript:", a4);
  objc_msgSend(v5, "setFlags:", (unint64_t)objc_msgSend(v5, "flags") | a3);
  return 0;
}

- (void)setOffset:(unint64_t)a3 flags:(unint64_t)a4 forFileID:(id)a5
{
  MBDatabaseIndexEntry *v10;

  if (-[MBDatabaseIndex offsetForFileID:](self, "offsetForFileID:", a5) != -1)
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBDatabaseIndex.m"), 87, CFSTR("Duplicate file ID: %@"), a5);
  v10 = -[MBDatabaseIndexEntry initWithOffset:flags:]([MBDatabaseIndexEntry alloc], "initWithOffset:flags:", a3, a4);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_entriesByFileID, "setObject:forKeyedSubscript:", v10, a5);

}

- (NSString)description
{
  uint64_t v3;
  uint64_t v4;

  v3 = objc_opt_class(self);
  -[MBDatabaseIndex version](self, "version");
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: version=%0.1f, count=%d>"), v3, v4, -[MBDatabaseIndex count](self, "count"));
}

- (double)version
{
  return self->_version;
}

- (BOOL)containsDomainRedirects
{
  return self->_domainRedirects;
}

- (void)setDomainRedirects:(BOOL)a3
{
  self->_domainRedirects = a3;
}

@end
