@implementation UIViewFloatAnimatableProperty(UserNotificationsUIKit)

+ (id)unui_animatablePropertyWithProgressMilestones:()UserNotificationsUIKit block:
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  id v19;
  id v20;
  id v21;
  id location;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v5, "count");
  v8 = 0;
  if (v6 && v7)
  {
    v9 = (void *)objc_msgSend(v5, "mutableCopy");
    v8 = objc_alloc_init(MEMORY[0x1E0DC3F30]);
    objc_msgSend(v8, "setValue:", 0.0);
    objc_initWeak(&location, v8);
    v10 = (void *)MEMORY[0x1E0DC3F10];
    v23[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __109__UIViewFloatAnimatableProperty_UserNotificationsUIKit__unui_animatablePropertyWithProgressMilestones_block___block_invoke;
    v18 = &unk_1E8D1EC28;
    objc_copyWeak(&v21, &location);
    v12 = v9;
    v19 = v12;
    v13 = v6;
    v20 = v13;
    objc_msgSend(v10, "_createTransformerWithInputAnimatableProperties:presentationValueChangedCallback:", v11, &v15);

    if (objc_msgSend(v12, "containsObject:", &unk_1E8D5FED0, v15, v16, v17, v18))
    {
      (*((void (**)(id, id, double, double))v13 + 2))(v13, v8, 0.0, 0.0);
      objc_msgSend(v12, "removeObject:", &unk_1E8D5FED0);
    }

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);

  }
  return v8;
}

@end
