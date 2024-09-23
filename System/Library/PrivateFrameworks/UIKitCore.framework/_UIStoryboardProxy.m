@implementation _UIStoryboardProxy

- (_UIStoryboardProxy)initWithStoryboard:(id)a3
{
  _UIStoryboardProxy *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIStoryboardProxy;
  v4 = -[_UIStoryboardProxy init](&v6, sel_init);
  if (v4)
  {
    if (a3)
    {
      v4->_storyboard = (UIStoryboard *)a3;
    }
    else
    {
      if (_UIStateRestorationDebugLogEnabled())
        NSLog(CFSTR("%s: Warning! Tried to create _UIStoryboardProxy for object without storyboard: %@"), "-[_UIStoryboardProxy initWithStoryboard:]", 0);
      return 0;
    }
  }
  return v4;
}

- (_UIStoryboardProxy)initWithCoder:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _UIStoryboardProxy *v9;
  UIStoryboard *v11;

  v5 = objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kStoryboardNameKey"));
  if (v5)
  {
    v6 = v5;
    v7 = objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kStoryboardBundlePathKey"));
    if (v7)
      v8 = objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithPath:", v7);
    else
      v8 = 0;
    v11 = +[UIStoryboard storyboardWithName:bundle:](UIStoryboard, "storyboardWithName:bundle:", v6, v8);
  }
  else
  {
    if (_UIStateRestorationDebugLogEnabled())
      NSLog(CFSTR("%s: No Storyboard name, skipping decode and returning nil: %@"), "-[_UIStoryboardProxy initWithCoder:]", self);
    v11 = 0;
  }
  v9 = self;
  return (_UIStoryboardProxy *)v11;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *v5;
  NSBundle *v6;
  NSBundle *v7;
  uint64_t v8;

  v5 = -[UIStoryboard name](self->_storyboard, "name");
  if (v5)
  {
    objc_msgSend(a3, "encodeObject:forKey:", v5, CFSTR("kStoryboardNameKey"));
    v6 = -[UIStoryboard bundle](self->_storyboard, "bundle");
    if (v6)
    {
      v7 = v6;
      if (v6 != (NSBundle *)objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle"))
      {
        v8 = -[NSBundle bundlePath](v7, "bundlePath");
        if (v8)
        {
          objc_msgSend(a3, "encodeObject:forKey:", v8, CFSTR("kStoryboardBundlePathKey"));
        }
        else if (_UIStateRestorationDebugLogEnabled())
        {
          NSLog(CFSTR("%s: Storyboard bundle has no path, skipping: %@"), "-[_UIStoryboardProxy encodeWithCoder:]", v7);
        }
      }
    }
  }
  else if (_UIStateRestorationDebugLogEnabled())
  {
    NSLog(CFSTR("%s: Storyboard has no name, skipping: %@"), "-[_UIStoryboardProxy encodeWithCoder:]", self->_storyboard);
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s<%p>: %@"), object_getClassName(self), self, self->_storyboard);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIStoryboardProxy;
  -[_UIStoryboardProxy dealloc](&v3, sel_dealloc);
}

@end
