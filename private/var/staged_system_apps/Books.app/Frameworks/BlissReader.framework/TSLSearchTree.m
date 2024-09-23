@implementation TSLSearchTree

- (TSLSearchTree)init
{
  TSLSearchTree *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSLSearchTree;
  result = -[TSLSearchTree init](&v3, "init");
  if (result)
    result->mRoot = 0;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSLSearchTree;
  -[TSLSearchTree dealloc](&v3, "dealloc");
}

- (void)insertWord:(id)a3 value:(id)a4
{
  id v5;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  _QWORD *v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3052000000;
  v10 = sub_22061C;
  v11 = sub_22062C;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_220638;
  v6[3] = &unk_43B758;
  v6[4] = &v7;
  v12 = v6;
  v5 = objc_msgSend(a3, "createQueryString");
  self->mRoot = (TSLSearchTreeNode *)(*(uint64_t (**)(void))(v8[5] + 16))();
  free(v5);
  _Block_object_dispose(&v7, 8);
}

- (id)wordsForPrefix:(id)a3
{
  id v4;
  id v5;

  v4 = objc_msgSend(a3, "createQueryString");
  v5 = -[TSLSearchTreeNode find:](self->mRoot, "find:", v4);
  free(v4);
  if (v5)
    return objc_msgSend(v5, "collect");
  else
    return 0;
}

- (void)enumerateWordsForPrefix:(id)a3 withBlock:(id)a4
{
  id v6;

  v6 = objc_msgSend(a3, "createQueryString");
  objc_msgSend(-[TSLSearchTreeNode find:](self->mRoot, "find:", v6), "traverse:", a4);
  free(v6);
}

@end
