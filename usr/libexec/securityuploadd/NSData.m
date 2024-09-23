@implementation NSData

- (id)supd_gzipDeflate
{
  NSData *v3;
  void *v4;
  void *v5;
  uLong total_out;
  id v7;
  char *v8;
  unsigned int v9;
  z_stream v11;

  if (!-[NSData length](self, "length"))
    return self;
  memset(&v11.total_out, 0, 72);
  v3 = objc_retainAutorelease(self);
  v11.avail_in = -[NSData length](v3, "length", -[NSData bytes](v3, "bytes"), (unsigned __int128)0, (unsigned __int128)0);
  v4 = 0;
  if (!deflateInit2_(&v11, 9, 8, 31, 9, 0, "1.2.12", 112))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithLength:](NSMutableData, "dataWithLength:", 0x4000));
    do
    {
      total_out = v11.total_out;
      if (total_out >= (unint64_t)objc_msgSend(v5, "length"))
        objc_msgSend(v5, "increaseLengthBy:", 0x4000);
      v7 = objc_retainAutorelease(v5);
      v8 = (char *)objc_msgSend(v7, "mutableBytes");
      v11.next_out = (Bytef *)&v8[v11.total_out];
      v9 = objc_msgSend(v7, "length");
      v11.avail_out = v9 - LODWORD(v11.total_out);
      deflate(&v11, 4);
    }
    while (!v11.avail_out);
    deflateEnd(&v11);
    objc_msgSend(v7, "setLength:", v11.total_out);
    if (v11.avail_in)
      v4 = 0;
    else
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithData:](NSData, "dataWithData:", v7));

  }
  return v4;
}

@end
