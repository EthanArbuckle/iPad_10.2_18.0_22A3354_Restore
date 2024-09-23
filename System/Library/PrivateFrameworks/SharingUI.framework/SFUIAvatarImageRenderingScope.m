@implementation SFUIAvatarImageRenderingScope

+ (id)scopeWithPointSize:(CGSize)a3 scale:(double)a4 rightToLeft:(BOOL)a5 style:(unint64_t)a6 backgroundStyle:(unint64_t)a7
{
  _BOOL8 v9;
  double height;
  double width;
  SFUIAvatarImageRenderingScope *v13;
  unint64_t v14;
  void *v15;

  v9 = a5;
  height = a3.height;
  width = a3.width;
  v13 = objc_alloc_init(SFUIAvatarImageRenderingScope);
  if (a7 - 2 >= 3)
    v14 = 0;
  else
    v14 = a7 - 1;
  objc_msgSend(getCNAvatarImageRenderingScopeClass(), "scopeWithPointSize:scale:rightToLeft:style:backgroundStyle:", v9, a6 == 2, v14, width, height, a4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFUIAvatarImageRenderingScope setScope:](v13, "setScope:", v15);

  return v13;
}

- (CNAvatarImageRenderingScope)scope
{
  return self->_scope;
}

- (void)setScope:(id)a3
{
  objc_storeStrong((id *)&self->_scope, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scope, 0);
}

@end
