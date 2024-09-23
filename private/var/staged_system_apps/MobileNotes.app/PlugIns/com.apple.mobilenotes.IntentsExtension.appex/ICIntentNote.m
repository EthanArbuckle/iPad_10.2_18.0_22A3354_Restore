@implementation ICIntentNote

- (ICIntentNote)initWithObject:(id)a3
{
  return -[ICIntentNote initWithObject:folderNoteSortType:](self, "initWithObject:folderNoteSortType:", a3, 0);
}

- (ICIntentNote)initWithObject:(id)a3 folderNoteSortType:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  unsigned int v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  ICIntentNote *v23;
  _QWORD v25[4];
  NSObject *v26;
  ICIntentNote *v27;
  id v28;
  uint64_t *v29;
  _QWORD v30[4];
  NSObject *v31;
  ICIntentNote *v32;
  id v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  uint8_t buf[24];

  v6 = a3;
  v7 = a4;
  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = sub_100010F64;
  v39 = sub_100010F74;
  v40 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectID"));
  v9 = objc_msgSend(v8, "ic_isModernNoteType");

  if (v9)
  {
    v10 = objc_opt_class(ICNote);
    v11 = ICDynamicCast(v10, v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "managedObjectContext"));
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_100010F7C;
    v30[3] = &unk_100020DA8;
    v14 = v12;
    v31 = v14;
    v34 = &v35;
    v32 = self;
    v33 = v7;
    objc_msgSend(v13, "performBlockAndWait:", v30);

    v15 = v31;
  }
  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectID"));
    v17 = objc_msgSend(v16, "ic_isLegacyNoteType");

    if (v17)
    {
      v18 = objc_opt_class(NSManagedObject);
      v19 = ICClassAndProtocolCast(v6, v18, 2);
      v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "managedObjectContext", &OBJC_PROTOCOL___ICLegacyNote, &OBJC_PROTOCOL___ICSearchIndexableNote));
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_1000110F0;
      v25[3] = &unk_100020DA8;
      v14 = v20;
      v26 = v14;
      v29 = &v35;
      v27 = self;
      v28 = v7;
      objc_msgSend(v21, "performBlockAndWait:", v25);

      v15 = v26;
    }
    else
    {
      v15 = os_log_create("com.apple.notes", "Intents");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectID"));
        sub_1000141A4(v22, buf, v15);
      }
      v14 = v15;
    }
  }

  v23 = (ICIntentNote *)(id)v36[5];
  _Block_object_dispose(&v35, 8);

  return v23;
}

- (ICIntentNote)initWithIdentifier:(id)a3 title:(id)a4 date:(id)a5 contentInfo:(id)a6 isLocked:(BOOL)a7 isShared:(BOOL)a8 isUnread:(BOOL)a9
{
  _BOOL4 v9;
  _BOOL4 v10;
  id v15;
  id v16;
  ICIntentNote *v17;
  void *v18;
  void *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  objc_super v28;

  v9 = a8;
  v10 = a7;
  v15 = a5;
  v16 = a6;
  v28.receiver = self;
  v28.super_class = (Class)ICIntentNote;
  v17 = -[ICIntentNote initWithIdentifier:displayString:](&v28, "initWithIdentifier:displayString:", a3, a4);
  if (v17)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "ic_briefFormattedDate"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", CFSTR("%@  %@"), v18, v16));
    -[ICIntentNote setSubtitleString:](v17, "setSubtitleString:", v19);

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithScale:](UIImageSymbolConfiguration, "configurationWithScale:", 3));
    if (v9)
    {
      v21 = CFSTR("person.crop.circle");
    }
    else
    {
      if (!v10)
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("circle.fill"), v20));
        v23 = objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
        goto LABEL_8;
      }
      v21 = CFSTR("lock.fill");
    }
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", v21, v20));
    v23 = objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
LABEL_8:
    v24 = (void *)v23;
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "imageWithTintColor:", v23));

    v26 = (void *)objc_claimAutoreleasedReturnValue(+[INImage imageWithUIImage:](INImage, "imageWithUIImage:", v25));
    -[ICIntentNote setDisplayImage:](v17, "setDisplayImage:", v26);

  }
  return v17;
}

@end
