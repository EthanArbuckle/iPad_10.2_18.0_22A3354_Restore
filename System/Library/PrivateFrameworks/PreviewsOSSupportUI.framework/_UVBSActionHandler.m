@implementation _UVBSActionHandler

- (_UVBSActionHandler)initWithHandler:(id)a3
{
  id v4;
  _UVBSActionHandler *v5;
  void *v6;
  id handler;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UVBSActionHandler;
  v5 = -[_UVBSActionHandler init](&v9, sel_init);
  if (v5)
  {
    v6 = _Block_copy(v4);
    handler = v5->_handler;
    v5->_handler = v6;

  }
  return v5;
}

- (id)_respondToActions:(id)a3 forFBSScene:(id)a4 inUIScene:(id)a5 fromTransitionContext:(id)a6
{
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = (void *)objc_msgSend(v7, "mutableCopy");
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v13);
        if ((*((unsigned int (**)(id))self->_handler + 2))(self->_handler))
          objc_msgSend(v8, "removeObject:", v14, (_QWORD)v16);
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
}

@end
