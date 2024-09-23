@implementation UISwipeAction

+ (id)swipeActionWithStyle:(int64_t)a3 title:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v8 = a5;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __52__UISwipeAction_swipeActionWithStyle_title_handler___block_invoke;
  v12[3] = &unk_1E16BCAF0;
  v13 = v8;
  v9 = v8;
  objc_msgSend(a1, "contextualActionWithStyle:title:handler:", a3, a4, v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __52__UISwipeAction_swipeActionWithStyle_title_handler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v7;
  void (*v8)(uint64_t, id, uint64_t);
  void (**v9)(id, uint64_t);
  id v10;

  v10 = a2;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void (**)(uint64_t, id, uint64_t))(v7 + 16);
  v9 = a4;
  v8(v7, v10, a3);
  if (objc_msgSend(v10, "resetsSwipedRow"))
    v9[2](v9, 1);
  else
    objc_msgSend(v10, "setCompletionHandler:", v9);

}

- (UISwipeAction)init
{
  UISwipeAction *v2;
  UISwipeAction *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UISwipeAction;
  v2 = -[UISwipeAction init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[UISwipeAction setResetsSwipedRow:](v2, "setResetsSwipedRow:", 1);
    -[UISwipeAction setCanBeTriggeredBySwipe:](v3, "setCanBeTriggeredBySwipe:", 1);
  }
  return v3;
}

- (void)resetSwipedRow
{
  void *v3;
  void (**v4)(_QWORD, _QWORD);
  id completionHandler;

  -[UISwipeAction completionHandler](self, "completionHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[UISwipeAction completionHandler](self, "completionHandler");
    v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v4[2](v4, 1);

    completionHandler = self->_completionHandler;
    self->_completionHandler = 0;

  }
}

- (UIVisualEffect)backgroundEffect
{
  return self->_backgroundEffect;
}

- (void)setBackgroundEffect:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (BOOL)canBeTriggeredBySwipe
{
  return self->_canBeTriggeredBySwipe;
}

- (void)setCanBeTriggeredBySwipe:(BOOL)a3
{
  self->_canBeTriggeredBySwipe = a3;
}

- (BOOL)resetsSwipedRow
{
  return self->_resetsSwipedRow;
}

- (void)setResetsSwipedRow:(BOOL)a3
{
  self->_resetsSwipedRow = a3;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_backgroundEffect, 0);
}

@end
