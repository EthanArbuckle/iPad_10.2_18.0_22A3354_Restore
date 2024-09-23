@implementation NFTrustDBApplet

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NFTrustDBApplet)initWithCoder:(id)a3
{
  id v4;
  NFTrustDBApplet *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  unint64_t v13;
  char v14;
  char v15;
  void *v16;
  id v17;
  KeyInSlot *v18;
  void *v19;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)NFTrustDBApplet;
  v5 = -[NFTrustObject initWithCoder:](&v21, "initWithCoder:", v4);
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("instanceAID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    -[NFTrustDBApplet setValue:forKey:](v5, "setValue:forKey:", v7, CFSTR("instanceAID"));

    v8 = +[NFNSCheckedDecoder coder:decodeArrayOfClass:forKey:](NFNSCheckedDecoder, "coder:decodeArrayOfClass:forKey:", v4, objc_opt_class(KeyInSlot), CFSTR("map"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    -[NFTrustDBApplet setValue:forKey:](v5, "setValue:forKey:", v9, CFSTR("map"));

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NFTrustDBApplet map](v5, "map"));
    v11 = objc_msgSend(v10, "count");

    if (v11 != (id)2)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
      v13 = 0;
      v14 = 1;
      do
      {
        v15 = v14;
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[NFTrustDBApplet map](v5, "map"));
        v17 = objc_msgSend(v16, "count");

        if ((unint64_t)v17 <= v13)
        {
          v18 = [KeyInSlot alloc];
          objc_msgSend(v12, "addObject:", v18);
        }
        else
        {
          v18 = (KeyInSlot *)objc_claimAutoreleasedReturnValue(-[NFTrustDBApplet map](v5, "map"));
          v19 = (void *)objc_claimAutoreleasedReturnValue(-[KeyInSlot objectAtIndex:](v18, "objectAtIndex:", v13));
          objc_msgSend(v12, "addObject:", v19);

        }
        v14 = 0;
        v13 = 1;
      }
      while ((v15 & 1) != 0);
      -[NFTrustDBApplet setMap:](v5, "setMap:", v12);

    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NFTrustDBApplet instanceAID](self, "instanceAID"));
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("instanceAID"));

  v6 = (id)objc_claimAutoreleasedReturnValue(-[NFTrustDBApplet map](self, "map"));
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("map"));

}

- (NSString)instanceAID
{
  return self->_instanceAID;
}

- (void)setInstanceAID:(id)a3
{
  objc_storeStrong((id *)&self->_instanceAID, a3);
}

- (NSArray)map
{
  return self->_map;
}

- (void)setMap:(id)a3
{
  objc_storeStrong((id *)&self->_map, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_map, 0);
  objc_storeStrong((id *)&self->_instanceAID, 0);
}

@end
