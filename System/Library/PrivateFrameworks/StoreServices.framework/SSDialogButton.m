@implementation SSDialogButton

- (SSDialogButton)init
{
  return -[SSDialogButton initWithTitle:actionDictionary:](self, "initWithTitle:actionDictionary:", 0, 0);
}

- (SSDialogButton)initWithTitle:(id)a3 actionDictionary:(id)a4
{
  SSDialogButton *v7;
  objc_super v9;

  if (!objc_msgSend(a3, "length"))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Button must have a title"));
  v9.receiver = self;
  v9.super_class = (Class)SSDialogButton;
  v7 = -[SSDialogButton init](&v9, sel_init);
  if (v7)
  {
    v7->_actionDictionary = (NSDictionary *)objc_msgSend(a4, "copy");
    v7->_title = (NSString *)objc_msgSend(a3, "copy");
  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SSDialogButton;
  -[SSDialogButton dealloc](&v3, sel_dealloc);
}

- (NSString)buttonTitle
{
  return self->_title;
}

+ (SSDialogButton)buttonWithTitle:(id)a3
{
  return (SSDialogButton *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithTitle:actionDictionary:", a3, 0);
}

- (id)actionParameter
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  return (id)SSValueForFirstAvailableKey(self->_actionDictionary, (uint64_t)CFSTR("buyParams"), v2, v3, v4, v5, v6, v7, (uint64_t)CFSTR("buy-params"));
}

- (NSString)buttonAction
{
  NSString *v2;

  v2 = -[SSDialogButton valueForActionProperty:](self, "valueForActionProperty:", CFSTR("kind"));
  if (-[NSString caseInsensitiveCompare:](v2, "caseInsensitiveCompare:", CFSTR("goback")))
    return v2;
  else
    return (NSString *)CFSTR("goback");
}

- (NSString)URLTarget
{
  return (NSString *)-[SSDialogButton valueForActionProperty:](self, "valueForActionProperty:", CFSTR("subtarget"));
}

- (id)valueForActionProperty:(id)a3
{
  return -[NSDictionary objectForKey:](self->_actionDictionary, "objectForKey:", a3);
}

@end
