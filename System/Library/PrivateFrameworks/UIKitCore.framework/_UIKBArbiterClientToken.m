@implementation _UIKBArbiterClientToken

+ (id)uniqueToken
{
  return objc_alloc_init((Class)a1);
}

- (_UIKBArbiterClientToken)init
{
  _UIKBArbiterClientToken *v2;
  int v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIKBArbiterClientToken;
  v2 = -[_UIKBArbiterClientToken init](&v5, sel_init);
  if (v2)
  {
    if (qword_1ECD7AE20 != -1)
      dispatch_once(&qword_1ECD7AE20, &__block_literal_global_683);
    v3 = _MergedGlobals_9_13++;
    v2->_identifier = v3;
  }
  return v2;
}

- (BOOL)isEqual:(id)a3
{
  _DWORD *v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0 && self->_identifier == v4[2];

  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIKBArbiterClientToken;
  -[_UIKBArbiterClientToken description](&v7, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIKBArbiterClientToken sceneIdentityString](self, "sceneIdentityString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" scene identity string %@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSString)sceneIdentityString
{
  return self->_sceneIdentityString;
}

- (void)setSceneIdentityString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneIdentityString, 0);
}

@end
