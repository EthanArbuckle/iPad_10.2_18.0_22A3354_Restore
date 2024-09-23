@implementation SUScriptSegmentedControlItem

- (SUScriptSegmentedControlItem)initWithPageSection:(id)a3
{
  SUScriptSegmentedControlItem *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SUScriptSegmentedControlItem;
  v4 = -[SUScriptObject init](&v6, sel_init);
  if (v4)
  {
    v4->_identifier = (NSString *)(id)objc_msgSend(a3, "identifier");
    v4->_image = (UIImage *)(id)objc_msgSend(a3, "image");
    v4->_title = (NSString *)(id)objc_msgSend(a3, "title");
    v4->_userInfo = -[SUScriptURLRequest initWithNativeRequestProperties:]([SUScriptURLRequest alloc], "initWithNativeRequestProperties:", objc_msgSend(a3, "URLRequestProperties"));
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUScriptSegmentedControlItem;
  -[SUScriptObject dealloc](&v3, sel_dealloc);
}

- (id)newPageSection
{
  SUPageSection *v3;
  id v4;
  void *v5;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  NSString *v9;

  v3 = objc_alloc_init(SUPageSection);
  v4 = -[SUScriptSegmentedControlItem userInfo](self, "userInfo");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SUPageSection setStructuredPageType:](v3, "setStructuredPageType:", +[SUStructuredPage pageTypeForStorePageString:](SUStructuredPage, "pageTypeForStorePageString:", v4));
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = (void *)objc_msgSend(v4, "copyNativeRequestProperties");
      -[SUPageSection setURLRequestProperties:](v3, "setURLRequestProperties:", v5);

    }
  }
  if (-[SUPageSection URLRequestProperties](v3, "URLRequestProperties")
    || -[SUPageSection structuredPageType](v3, "structuredPageType") == 8)
  {
    v6 = -[SUScriptSegmentedControlItem identifier](self, "identifier");
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
    -[SUPageSection setIdentifier:](v3, "setIdentifier:", v7);
    -[SUPageSection setImage:](v3, "setImage:", -[SUScriptSegmentedControlItem image](self, "image"));
    v8 = -[SUScriptSegmentedControlItem title](self, "title");
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;
    -[SUPageSection setTitle:](v3, "setTitle:", v9);
  }
  else
  {

    return 0;
  }
  return v3;
}

- (SUScriptCanvasContext)canvas
{
  SUScriptCanvasContext *v3;

  -[SUScriptObject lock](self, "lock");
  v3 = self->_canvas;
  -[SUScriptObject unlock](self, "unlock");
  if (v3)
    return v3;
  else
    return (SUScriptCanvasContext *)objc_msgSend(MEMORY[0x24BDBCEF8], "null");
}

- (id)_className
{
  return CFSTR("iTunesSegmentedControlItem");
}

- (NSString)identifier
{
  NSString *v3;

  -[SUScriptObject lock](self, "lock");
  v3 = self->_identifier;
  -[SUScriptObject unlock](self, "unlock");
  if (v3)
    return v3;
  else
    return (NSString *)objc_msgSend(MEMORY[0x24BDBCEF8], "null");
}

- (NSString)imageURL
{
  NSString *v3;

  -[SUScriptObject lock](self, "lock");
  v3 = self->_imageURLString;
  -[SUScriptObject unlock](self, "unlock");
  if (v3)
    return v3;
  else
    return (NSString *)objc_msgSend(MEMORY[0x24BDBCEF8], "null");
}

- (void)setCanvas:(id)a3
{
  SUScriptCanvasContext *v5;
  char isKindOfClass;
  SUScriptCanvasContext *canvas;
  id v8;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v5 = 0;
    if (a3)
    {
      if ((isKindOfClass & 1) == 0)
      {
        objc_opt_class();
        v5 = (SUScriptCanvasContext *)a3;
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
          return;
        }
      }
    }
  }
  -[SUScriptObject lock](self, "lock");
  canvas = self->_canvas;
  if (canvas != v5)
  {

    self->_canvas = v5;
  }
  -[SUScriptObject unlock](self, "unlock");
  v8 = -[SUScriptCanvasContext copyCanvasImage](v5, "copyCanvasImage");
  WebThreadRunOnMainThread();

}

uint64_t __42__SUScriptSegmentedControlItem_setCanvas___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setImage:", *(_QWORD *)(a1 + 40));
}

- (void)setIdentifier:(id)a3
{
  NSString *v5;
  char isKindOfClass;
  NSString *identifier;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v5 = 0;
    if (a3)
    {
      if ((isKindOfClass & 1) == 0)
      {
        objc_opt_class();
        v5 = (NSString *)a3;
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
          return;
        }
      }
    }
  }
  -[SUScriptObject lock](self, "lock");
  identifier = self->_identifier;
  if (identifier != v5)
  {

    self->_identifier = v5;
  }
  -[SUScriptObject unlock](self, "unlock");
}

- (void)setImageURL:(id)a3
{
  NSString *v5;
  char isKindOfClass;
  uint64_t v7;
  void *v8;
  NSString *imageURLString;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v5 = 0;
    if (a3)
    {
      if ((isKindOfClass & 1) == 0)
      {
        objc_opt_class();
        v5 = (NSString *)a3;
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_10;
      }
    }
  }
  v7 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", v5);
  if (!v7)
  {
LABEL_10:
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
    return;
  }
  v8 = (void *)v7;
  -[SUScriptObject lock](self, "lock");
  imageURLString = self->_imageURLString;
  if (imageURLString != v5)
  {

    self->_imageURLString = v5;
  }
  -[SUScriptObject unlock](self, "unlock");
  WebThreadRunOnMainThread();

}

void __44__SUScriptSegmentedControlItem_setImageURL___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  int v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(*(id *)(a1 + 32), "newImageWithURL:", *(_QWORD *)(a1 + 40));
  if (v2)
  {
    v11 = (id)v2;
    objc_msgSend(*(id *)(a1 + 32), "_setImage:", v2);

  }
  else
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v4 = objc_msgSend(v3, "shouldLog");
    if (objc_msgSend(v3, "shouldLogToDisk"))
      v5 = v4 | 2;
    else
      v5 = v4;
    if (!os_log_type_enabled((os_log_t)objc_msgSend(v3, "OSLogObject"), OS_LOG_TYPE_DEFAULT))
      v5 &= 2u;
    if (v5)
    {
      v6 = objc_opt_class();
      v7 = *(_QWORD *)(a1 + 40);
      v12 = 138412546;
      v13 = v6;
      v14 = 2112;
      v15 = v7;
      LODWORD(v10) = 22;
      v8 = _os_log_send_and_compose_impl();
      if (v8)
      {
        v9 = (void *)v8;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v8, 4, &v12, v10);
        free(v9);
        SSFileLog();
      }
    }
  }
}

- (void)setTitle:(id)a3
{
  char isKindOfClass;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), isKindOfClass = objc_opt_isKindOfClass(), !a3)
    || (isKindOfClass & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    WebThreadRunOnMainThread();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
  }
}

uint64_t __41__SUScriptSegmentedControlItem_setTitle___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = (void *)v2[13];
  if (v3 != *(void **)(a1 + 40))
  {

    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104) = *(id *)(a1 + 40);
    v2 = *(_QWORD **)(a1 + 32);
  }
  return objc_msgSend(v2, "_reloadUserInterface");
}

- (void)setUserInfo:(id)a3
{
  id userInfo;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    a3 = 0;
  -[SUScriptObject lock](self, "lock");
  userInfo = self->_userInfo;
  if (userInfo != a3)
  {

    self->_userInfo = a3;
  }
  -[SUScriptObject unlock](self, "unlock");
}

- (NSString)title
{
  void *v2;
  NSString *v3;
  NSString *v4;
  uint64_t v6;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  uint64_t v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3052000000;
  v11 = __Block_byref_object_copy__35;
  v12 = __Block_byref_object_dispose__35;
  v13 = 0;
  v6 = MEMORY[0x24BDAC760];
  WebThreadRunOnMainThread();
  v2 = (void *)v9[5];
  if (v2)
    v3 = v2;
  else
    v3 = (NSString *)objc_msgSend(MEMORY[0x24BDBCEF8], "null", v6, 3221225472, __37__SUScriptSegmentedControlItem_title__block_invoke, &unk_24DE7BE30, self, &v8);
  v4 = v3;
  _Block_object_dispose(&v8, 8);
  return v4;
}

uint64_t __37__SUScriptSegmentedControlItem_title__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "copy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (id)userInfo
{
  id v3;

  -[SUScriptObject lock](self, "lock");
  v3 = self->_userInfo;
  -[SUScriptObject unlock](self, "unlock");
  if (v3)
    return v3;
  else
    return (id)objc_msgSend(MEMORY[0x24BDBCEF8], "null");
}

- (void)_reloadUserInterface
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v3 = -[SUScriptSegmentedControlItem _segmentedControl](self, "_segmentedControl");
  v4 = (void *)objc_msgSend(v3, "rawSegments");
  if (v4)
  {
    v5 = objc_msgSend(v4, "indexOfObjectIdenticalTo:", self);
    if (v5 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v6 = v5;
      v7 = (void *)objc_msgSend(v3, "activeSegmentedControl");
      objc_msgSend(v7, "setImage:forSegmentAtIndex:", self->_image, v6);
      objc_msgSend(v7, "setTitle:forSegmentAtIndex:", self->_title, v6);
      v8 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v3, "storePageViewController"), "sectionGroup"), "sections"), "objectAtIndex:", v6);
      objc_msgSend(v8, "setImage:", self->_image);
      objc_msgSend(v8, "setTitle:", self->_title);
    }
  }
}

- (id)_segmentedControl
{
  SUScriptObject *v2;

  v2 = -[SUScriptObject parentScriptObject](self, "parentScriptObject");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return v2;
  else
    return 0;
}

- (void)_setImage:(id)a3
{
  UIImage *image;

  image = self->_image;
  if (image != a3)
  {

    self->_image = (UIImage *)a3;
  }
  -[SUScriptSegmentedControlItem _reloadUserInterface](self, "_reloadUserInterface");
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id result;
  objc_super v6;

  result = (id)objc_msgSend((id)__KeyMapping_47, "objectForKey:");
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptSegmentedControlItem;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForKeyName_, a3);
  }
  return result;
}

- (id)scriptAttributeKeys
{
  NSMutableArray *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUScriptSegmentedControlItem;
  v2 = -[SUScriptObject scriptAttributeKeys](&v4, sel_scriptAttributeKeys);
  -[NSMutableArray addObjectsFromArray:](v2, "addObjectsFromArray:", objc_msgSend((id)__KeyMapping_47, "allKeys"));
  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    __KeyMapping_47 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjectsAndKeys:", CFSTR("canvas"), CFSTR("identifier"), CFSTR("identifier"), CFSTR("imageURL"), CFSTR("imageURL"), CFSTR("title"), CFSTR("title"), CFSTR("userInfo"), CFSTR("userInfo"), 0);
}

- (UIImage)image
{
  return self->_image;
}

@end
