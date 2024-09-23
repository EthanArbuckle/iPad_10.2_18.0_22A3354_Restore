@implementation SSKDisplayAssertionPreferences

- (SSKDisplayAssertionPreferences)init
{
  SSKDisplayAssertionPreferences *v2;
  SSKDisplayAssertionPreferences *v3;
  SSKDisplayArrangementItem *displayArrangement;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SSKDisplayAssertionPreferences;
  v2 = -[SSKDisplayAssertionPreferences init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_wantsControlOfDisplay = 0;
    displayArrangement = v2->_displayArrangement;
    v2->_displayArrangement = 0;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  SSKDisplayAssertionPreferences *v4;

  v4 = objc_alloc_init(SSKDisplayAssertionPreferences);
  -[SSKDisplayAssertionPreferences setWantsControlOfDisplay:](v4, "setWantsControlOfDisplay:", self->_wantsControlOfDisplay);
  -[SSKDisplayAssertionPreferences setDisplayArrangement:](v4, "setDisplayArrangement:", self->_displayArrangement);
  -[SSKDisplayAssertionPreferences setCloneMirroringMode:](v4, "setCloneMirroringMode:", self->_cloneMirroringMode);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  SSKDisplayAssertionPreferences *v4;
  SSKDisplayAssertionPreferences *v5;
  BOOL v6;

  v4 = (SSKDisplayAssertionPreferences *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = self->_wantsControlOfDisplay == v5->_wantsControlOfDisplay
        && -[SSKDisplayArrangementItem isEqual:](self->_displayArrangement, "isEqual:", v5->_displayArrangement)
        && self->_cloneMirroringMode == v5->_cloneMirroringMode;

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  id v5;
  id v6;
  unint64_t v7;

  objc_msgSend(MEMORY[0x24BE0BE28], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendBool:", self->_wantsControlOfDisplay);
  v5 = (id)objc_msgSend(v3, "appendObject:", self->_displayArrangement);
  v6 = (id)objc_msgSend(v3, "appendUnsignedInteger:", self->_cloneMirroringMode);
  v7 = objc_msgSend(v3, "hash");

  return v7;
}

- (id)description
{
  void *v3;
  id v4;
  id v5;
  unint64_t cloneMirroringMode;
  const __CFString *v7;
  const __CFString *v8;
  void *v9;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendBool:withName:", self->_wantsControlOfDisplay, CFSTR("wantsControl"));
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", self->_displayArrangement, CFSTR("arrangement"));
  cloneMirroringMode = self->_cloneMirroringMode;
  v7 = CFSTR("<.Invalid>");
  if (cloneMirroringMode == 1)
    v7 = CFSTR(".Default");
  if (cloneMirroringMode == 2)
    v8 = CFSTR(".Disabled");
  else
    v8 = v7;
  objc_msgSend(v3, "appendString:withName:", v8, CFSTR("cloneMirroringMode"));
  objc_msgSend(v3, "build");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)wantsControlOfDisplay
{
  return self->_wantsControlOfDisplay;
}

- (void)setWantsControlOfDisplay:(BOOL)a3
{
  self->_wantsControlOfDisplay = a3;
}

- (SSKDisplayArrangementItem)displayArrangement
{
  return self->_displayArrangement;
}

- (void)setDisplayArrangement:(id)a3
{
  objc_storeStrong((id *)&self->_displayArrangement, a3);
}

- (unint64_t)cloneMirroringMode
{
  return self->_cloneMirroringMode;
}

- (void)setCloneMirroringMode:(unint64_t)a3
{
  self->_cloneMirroringMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayArrangement, 0);
}

@end
