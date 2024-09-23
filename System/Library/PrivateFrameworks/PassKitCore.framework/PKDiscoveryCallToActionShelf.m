@implementation PKDiscoveryCallToActionShelf

- (PKDiscoveryCallToActionShelf)initWithDictionary:(id)a3
{
  id v4;
  PKDiscoveryCallToActionShelf *v5;
  PKDiscoveryCallToActionShelf *v6;
  void *v7;
  PKDiscoveryCallToAction *v8;
  PKDiscoveryCallToAction *callToAction;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKDiscoveryCallToActionShelf;
  v5 = -[PKDiscoveryCallToActionShelf init](&v11, sel_init);
  v6 = v5;
  if (v5)
  {
    -[PKDiscoveryShelf setType:](v5, "setType:", 4);
    v6->_useImageAsTitle = objc_msgSend(v4, "PKBoolForKey:", CFSTR("useImageAsTitle"));
    objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("callToAction"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = -[PKDiscoveryCallToAction initWithDictionary:]([PKDiscoveryCallToAction alloc], "initWithDictionary:", v7);
      callToAction = v6->_callToAction;
      v6->_callToAction = v8;

    }
  }

  return v6;
}

- (void)setItem:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKDiscoveryCallToActionShelf;
  v4 = a3;
  -[PKDiscoveryShelf setItem:](&v5, sel_setItem_, v4);
  -[PKDiscoveryCallToAction setItem:](self->_callToAction, "setItem:", v4, v5.receiver, v5.super_class);

}

- (void)localizeWithBundle:(id)a3
{
  -[PKDiscoveryCallToActionShelf localizeWithBundle:table:](self, "localizeWithBundle:table:", a3, CFSTR("localizable"));
}

- (void)localizeWithBundle:(id)a3 table:(id)a4
{
  -[PKDiscoveryCallToAction localizeWithBundle:table:](self->_callToAction, "localizeWithBundle:table:", a3, a4);
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  PKDiscoveryCallToAction *callToAction;
  PKDiscoveryCallToAction *v6;
  BOOL v7;
  BOOL v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKDiscoveryCallToActionShelf;
  if (-[PKDiscoveryShelf isEqual:](&v10, sel_isEqual_, v4))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      callToAction = self->_callToAction;
      v6 = (PKDiscoveryCallToAction *)v4[5];
      if (callToAction)
        v7 = v6 == 0;
      else
        v7 = 1;
      if (v7)
      {
        if (callToAction == v6)
        {
LABEL_12:
          v8 = self->_useImageAsTitle == *((unsigned __int8 *)v4 + 32);
          goto LABEL_10;
        }
      }
      else if (-[PKDiscoveryCallToAction isEqual:](callToAction, "isEqual:"))
      {
        goto LABEL_12;
      }
    }
  }
  v8 = 0;
LABEL_10:

  return v8;
}

- (unint64_t)hash
{
  id v3;
  id v4;
  uint64_t v5;
  unint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PKDiscoveryCallToActionShelf;
  v3 = -[PKDiscoveryShelf hash](&v8, sel_hash);
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v4, "safelyAddObject:", self->_callToAction);
  v5 = PKCombinedHash((uint64_t)v3, v4);
  v6 = self->_useImageAsTitle - v5 + 32 * v5;

  return v6;
}

- (id)description
{
  void *v3;
  const __CFString *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%ld'; "), CFSTR("shelfType"), -[PKDiscoveryShelf type](self, "type"));
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("callToAction"), self->_callToAction);
  if (self->_useImageAsTitle)
    v4 = CFSTR("YES");
  else
    v4 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("useImageAsTitle"), v4);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  v5 = (void *)objc_msgSend(v3, "copy");

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKDiscoveryCallToActionShelf;
  v4 = a3;
  -[PKDiscoveryShelf encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_callToAction, CFSTR("callToAction"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeBool:forKey:", self->_useImageAsTitle, CFSTR("useImageAsTitle"));

}

- (PKDiscoveryCallToActionShelf)initWithCoder:(id)a3
{
  id v4;
  PKDiscoveryCallToActionShelf *v5;
  uint64_t v6;
  PKDiscoveryCallToAction *callToAction;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKDiscoveryCallToActionShelf;
  v5 = -[PKDiscoveryShelf initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("callToAction"));
    v6 = objc_claimAutoreleasedReturnValue();
    callToAction = v5->_callToAction;
    v5->_callToAction = (PKDiscoveryCallToAction *)v6;

    v5->_useImageAsTitle = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("useImageAsTitle"));
  }

  return v5;
}

- (PKDiscoveryCallToAction)callToAction
{
  return self->_callToAction;
}

- (BOOL)useImageAsTitle
{
  return self->_useImageAsTitle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callToAction, 0);
}

@end
