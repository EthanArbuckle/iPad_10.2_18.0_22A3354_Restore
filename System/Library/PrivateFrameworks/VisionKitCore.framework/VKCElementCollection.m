@implementation VKCElementCollection

+ (id)collectionWithTitle:(id)a3 elementInfoText:(id)a4 parent:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = a3;
  +[VKCElementInfo infoWithText:parent:](VKCElementInfo, "infoWithText:parent:", a4, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "collectionWithTitle:children:parent:", v9, v11, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)collectionWithTitle:(id)a3 children:(id)a4 parent:(id)a5
{
  id v7;
  id v8;
  id v9;
  VKCElementCollection *v10;
  VKCElementCollection *v11;
  _QWORD v13[4];
  VKCElementCollection *v14;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = objc_alloc_init(VKCElementCollection);
  -[VKCElementCollection setTitle:](v10, "setTitle:", v9);

  -[VKCElementCollection set_children:](v10, "set_children:", v8);
  -[VKCBaseElement setParent:](v10, "setParent:", v7);

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __60__VKCElementCollection_collectionWithTitle_children_parent___block_invoke;
  v13[3] = &unk_1E94643F8;
  v11 = v10;
  v14 = v11;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v13);

  return v11;
}

void __60__VKCElementCollection_collectionWithTitle_children_parent___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  objc_msgSend(v3, "setParent:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v3, "children");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __60__VKCElementCollection_collectionWithTitle_children_parent___block_invoke_2;
  v6[3] = &unk_1E94643F8;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v6);

}

uint64_t __60__VKCElementCollection_collectionWithTitle_children_parent___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setParent:", *(_QWORD *)(a1 + 32));
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (NSArray)_children
{
  return self->__children;
}

- (void)set_children:(id)a3
{
  objc_storeStrong((id *)&self->__children, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__children, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
