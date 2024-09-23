@implementation WBSCyclerBookmarkLeafRepresentation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WBSCyclerBookmarkLeafRepresentation)initWithTitle:(id)a3 uniqueIdentifier:(id)a4
{

  return 0;
}

- (WBSCyclerBookmarkLeafRepresentation)initWithURL:(id)a3 title:(id)a4 uniqueIdentifier:(id)a5
{
  id v9;
  WBSCyclerBookmarkLeafRepresentation *v10;
  WBSCyclerBookmarkLeafRepresentation *v11;
  WBSCyclerBookmarkLeafRepresentation *v12;
  objc_super v14;

  v9 = a3;
  v14.receiver = self;
  v14.super_class = (Class)WBSCyclerBookmarkLeafRepresentation;
  v10 = -[WBSCyclerItemRepresentation initWithTitle:uniqueIdentifier:](&v14, sel_initWithTitle_uniqueIdentifier_, a4, a5);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_url, a3);
    v12 = v11;
  }

  return v11;
}

- (WBSCyclerBookmarkLeafRepresentation)initWithCoder:(id)a3
{
  id v4;
  WBSCyclerBookmarkLeafRepresentation *v5;
  uint64_t v6;
  NSURL *url;
  WBSCyclerBookmarkLeafRepresentation *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WBSCyclerBookmarkLeafRepresentation;
  v5 = -[WBSCyclerItemRepresentation initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("URL"));
    v6 = objc_claimAutoreleasedReturnValue();
    url = v5->_url;
    v5->_url = (NSURL *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WBSCyclerBookmarkLeafRepresentation;
  v4 = a3;
  -[WBSCyclerItemRepresentation encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_url, CFSTR("URL"), v5.receiver, v5.super_class);

}

- (id)copyWithZone:(_NSZone *)a3
{
  WBSCyclerBookmarkLeafRepresentation *v4;
  NSURL *url;
  void *v6;
  void *v7;
  WBSCyclerBookmarkLeafRepresentation *v8;
  void *v9;

  v4 = [WBSCyclerBookmarkLeafRepresentation alloc];
  url = self->_url;
  -[WBSCyclerItemRepresentation title](self, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSCyclerItemRepresentation uniqueIdentifier](self, "uniqueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[WBSCyclerBookmarkLeafRepresentation initWithURL:title:uniqueIdentifier:](v4, "initWithURL:title:uniqueIdentifier:", url, v6, v7);

  -[WBSCyclerItemRepresentation extraAttributes](self, "extraAttributes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSCyclerItemRepresentation setExtraAttributes:](v8, "setExtraAttributes:", v9);

  return v8;
}

- (BOOL)isEquivalent:(id)a3
{
  id v4;
  char v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)WBSCyclerBookmarkLeafRepresentation;
  if (-[WBSCyclerItemRepresentation isEquivalent:](&v7, sel_isEquivalent_, v4)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = WBSIsEqual();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (NSURL)url
{
  return self->_url;
}

- (void)setURL:(id)a3
{
  objc_storeStrong((id *)&self->_url, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
}

@end
