@implementation MBDatabaseBuilder

+ (id)databaseBuilderWithEncoder:(id)a3
{
  return -[MBDatabaseBuilder initWithEncoder:]([MBDatabaseBuilder alloc], "initWithEncoder:", a3);
}

- (MBDatabaseBuilder)initWithEncoder:(id)a3
{
  MBDatabaseBuilder *v4;
  MBEncoder *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MBDatabaseBuilder;
  v4 = -[MBDatabaseBuilder init](&v7, "init");
  if (v4)
  {
    v4->_index = objc_alloc_init(MBDatabaseIndex);
    v5 = (MBEncoder *)a3;
    v4->_encoder = v5;
    -[MBEncoder encodeInt32:](v5, "encodeInt32:", 1835164770);
    -[MBEncoder encodeVersion:](v4->_encoder, "encodeVersion:", 5.0);
    v4->_offsetBase = -[MBEncoder offset](v4->_encoder, "offset");
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MBDatabaseBuilder;
  -[MBDatabaseBuilder dealloc](&v3, "dealloc");
}

- (void)addFile:(id)a3 flags:(unint64_t)a4
{
  -[MBDatabaseIndex setOffset:flags:forFileID:](self->_index, "setOffset:flags:forFileID:", (char *)-[MBEncoder offset](self->_encoder, "offset") - self->_offsetBase, +[MBDatabaseIndex flagsForMode:](MBDatabaseIndex, "flagsForMode:", objc_msgSend(a3, "mode")) | a4, objc_msgSend(a3, "fileID"));
  objc_msgSend(a3, "encode:", self->_encoder);
  -[MBEncoder flush](self->_encoder, "flush");
}

- (void)addPlaceholderForFile:(id)a3 flags:(unint64_t)a4
{
  -[MBDatabaseIndex setOffset:flags:forFileID:](self->_index, "setOffset:flags:forFileID:", -1, +[MBDatabaseIndex flagsForMode:](MBDatabaseIndex, "flagsForMode:", objc_msgSend(a3, "mode")) | a4, objc_msgSend(a3, "fileID"));
}

- (void)close
{
  -[MBEncoder close](self->_encoder, "close");
}

- (MBEncoder)encoder
{
  return self->_encoder;
}

- (MBDatabaseIndex)index
{
  return self->_index;
}

@end
