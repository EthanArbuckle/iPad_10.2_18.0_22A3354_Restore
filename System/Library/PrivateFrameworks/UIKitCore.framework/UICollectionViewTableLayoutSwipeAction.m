@implementation UICollectionViewTableLayoutSwipeAction

+ (id)actionWithStyle:(int64_t)a3 title:(id)a4 handler:(id)a5
{
  id v8;
  void *v9;
  objc_super v11;
  _QWORD v12[4];
  id v13;

  v12[1] = 3221225472;
  v12[2] = __72__UICollectionViewTableLayoutSwipeAction_actionWithStyle_title_handler___block_invoke;
  v12[3] = &unk_1E16BCAF0;
  v13 = a5;
  v11.receiver = a1;
  v11.super_class = (Class)&OBJC_METACLASS___UICollectionViewTableLayoutSwipeAction;
  v12[0] = MEMORY[0x1E0C809B0];
  v8 = v13;
  objc_msgSendSuper2(&v11, sel_contextualActionWithStyle_title_handler_, a3, a4, v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

void __72__UICollectionViewTableLayoutSwipeAction_actionWithStyle_title_handler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  void (**v8)(id, uint64_t);

  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16);
  v8 = a4;
  v7(v6, a2, a3);
  v8[2](v8, 1);

}

@end
