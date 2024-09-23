@implementation PLChoosableItem

- (PLChoosableItem)initWithWidth:(int64_t)a3 height:(int64_t)a4 type:(int)a5 uniformTypeIdentifier:(id)a6
{
  id v10;
  PLChoosableItem *v11;
  uint64_t v12;
  NSString *uniformTypeIdentifier;
  objc_super v15;

  v10 = a6;
  v15.receiver = self;
  v15.super_class = (Class)PLChoosableItem;
  v11 = -[PLChoosableItem init](&v15, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v10, "copy");
    uniformTypeIdentifier = v11->_uniformTypeIdentifier;
    v11->_uniformTypeIdentifier = (NSString *)v12;

    v11->_width = a3;
    v11->_height = a4;
    v11->_type = a5;
  }

  return v11;
}

- (PLChoosableItem)initWithCloudResource:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  PLChoosableItem *v10;

  v4 = a3;
  v5 = objc_msgSend(v4, "unorientedWidth");
  v6 = objc_msgSend(v4, "unorientedHeight");
  v7 = objc_msgSend(v4, "cplType");
  objc_msgSend(v4, "uniformTypeIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PLChoosableItem initWithWidth:height:type:uniformTypeIdentifier:](self, "initWithWidth:height:type:uniformTypeIdentifier:", v5, v6, v7, v9);

  return v10;
}

- (id)description
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PLChoosableItem;
  -[PLChoosableItem description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" - width: %lld, height: %lld, type: %d, uti: %@"), self->_width, self->_height, self->_type, self->_uniformTypeIdentifier);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)isEqualToChoosableItem:(id)a3
{
  int type;

  type = self->_type;
  return type == objc_msgSend(a3, "type");
}

- (unint64_t)hash
{
  return self->_type;
}

- (BOOL)isEqual:(id)a3
{
  PLChoosableItem *v4;
  BOOL v5;

  v4 = (PLChoosableItem *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[PLChoosableItem isEqualToChoosableItem:](self, "isEqualToChoosableItem:", v4);
  }

  return v5;
}

- (int64_t)compareUsingWidth:(id)a3
{
  id v4;
  int64_t width;
  int64_t v6;
  int type;

  v4 = a3;
  width = self->_width;
  if (width > objc_msgSend(v4, "width"))
    goto LABEL_5;
  if (objc_msgSend(v4, "width") > self->_width)
  {
    v6 = -1;
    goto LABEL_6;
  }
  type = self->_type;
  if (type > (int)objc_msgSend(v4, "type"))
  {
LABEL_5:
    v6 = 1;
    goto LABEL_6;
  }
  if ((int)objc_msgSend(v4, "type") <= self->_type)
    v6 = 0;
  else
    v6 = -1;
LABEL_6:

  return v6;
}

- (int64_t)width
{
  return self->_width;
}

- (int64_t)height
{
  return self->_height;
}

- (int)type
{
  return self->_type;
}

- (NSString)uniformTypeIdentifier
{
  return self->_uniformTypeIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniformTypeIdentifier, 0);
}

+ (id)choosableItemsFromCloudResources:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  PLChoosableItem *v11;
  PLChoosableItem *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9);
        v11 = [PLChoosableItem alloc];
        v12 = -[PLChoosableItem initWithCloudResource:](v11, "initWithCloudResource:", v10, (_QWORD)v14);
        objc_msgSend(v4, "addObject:", v12);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  return v4;
}

@end
