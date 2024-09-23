@implementation SUPreferenceEntry

- (SUPreferenceEntry)initWithKey:(id)a3 type:(int64_t)a4 description:(id)a5
{
  id v9;
  id v10;
  SUPreferenceEntry *v11;
  SUPreferenceEntry *v12;
  objc_super v14;

  v9 = a3;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)SUPreferenceEntry;
  v11 = -[SUPreferenceEntry init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    if (v9)
      objc_storeStrong((id *)&v11->_preferenceKey, a3);
    v12->_type = a4;
    if (v10)
      objc_storeStrong((id *)&v12->_description, a5);
  }

  return v12;
}

- (NSString)preferenceKey
{
  return self->_preferenceKey;
}

- (int64_t)type
{
  return self->_type;
}

- (NSString)description
{
  return self->_description;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_description, 0);
  objc_storeStrong((id *)&self->_preferenceKey, 0);
}

@end
