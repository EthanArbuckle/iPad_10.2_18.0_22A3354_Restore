@implementation _UIRenderingEnvironmentAttributes

- (_UIRenderingEnvironmentAttributes)init
{
  -[_UIRenderingEnvironmentAttributes doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (_UIRenderingEnvironmentAttributes)initWithDisplayConfiguration:(id)a3
{
  id v4;
  _UIRenderingEnvironmentAttributes *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UIRenderingEnvironmentAttributes;
  v5 = -[_UIRenderingEnvironmentAttributes init](&v8, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "identity");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_displayID = objc_msgSend(v6, "displayID");

  }
  return v5;
}

- (BOOL)refersToSameDisplayConfiguration:(id)a3
{
  unsigned int displayID;
  void *v4;

  displayID = self->_displayID;
  objc_msgSend(a3, "identity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(displayID) = displayID == objc_msgSend(v4, "displayID");

  return displayID;
}

- (unint64_t)hash
{
  return self->_displayID;
}

- (BOOL)isEqual:(id)a3
{
  _UIRenderingEnvironmentAttributes *v4;
  BOOL v5;

  v4 = (_UIRenderingEnvironmentAttributes *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else if (-[_UIRenderingEnvironmentAttributes isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = self->_displayID == v4->_displayID;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)_UIRenderingEnvironmentAttributes;
  -[_UIRenderingEnvironmentAttributes description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ displayID=%li"), v4, self->_displayID);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (unsigned)displayID
{
  return self->_displayID;
}

@end
