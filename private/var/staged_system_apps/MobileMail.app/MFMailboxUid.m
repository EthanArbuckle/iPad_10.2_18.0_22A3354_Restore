@implementation MFMailboxUid

+ (id)shorcutIconNameForMailboxType:(int64_t)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  int64_t v7;
  void *v8;
  void *v9;
  _QWORD v11[8];
  _QWORD v12[8];

  v4 = (void *)qword_1005A9CE0;
  if (!qword_1005A9CE0)
  {
    v11[0] = &off_1005415A8;
    v11[1] = &off_1005415C0;
    v12[0] = MFImageGlyphGenericMailbox;
    v12[1] = MFImageGlyphTrashMailbox;
    v11[2] = &off_1005415D8;
    v11[3] = &off_1005415F0;
    v12[2] = MFImageGlyphSentMailbox;
    v12[3] = MFImageGlyphDraftMailbox;
    v11[4] = &off_100541608;
    v11[5] = &off_100541620;
    v12[4] = MFImageGlyphOutboxMailbox;
    v12[5] = MFImageGlyphInboxMailbox;
    v11[6] = &off_100541638;
    v11[7] = &off_100541650;
    v12[6] = MFImageGlyphArchiveMailbox;
    v12[7] = MFImageGlyphJunkMailbox;
    v5 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v12, v11, 8));
    v6 = (void *)qword_1005A9CE0;
    qword_1005A9CE0 = v5;

    v4 = (void *)qword_1005A9CE0;
  }
  if ((unint64_t)(a3 - 8) >= 0xFFFFFFFFFFFFFFF9)
    v7 = a3;
  else
    v7 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v7));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v8));

  return v9;
}

+ (id)iconFromBundle:(id)a3 forType:(int64_t)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int64_t v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[8];
  _QWORD v15[8];

  v5 = a3;
  v6 = (void *)qword_1005A9CE8;
  if (!qword_1005A9CE8)
  {
    v14[0] = &off_1005415A8;
    v14[1] = &off_1005415C0;
    v15[0] = MFImageGlyphGenericMailbox;
    v15[1] = MFImageGlyphTrashMailbox;
    v14[2] = &off_1005415D8;
    v14[3] = &off_1005415F0;
    v15[2] = MFImageGlyphSentMailbox;
    v15[3] = MFImageGlyphDraftMailbox;
    v14[4] = &off_100541608;
    v14[5] = &off_100541620;
    v15[4] = MFImageGlyphOutboxMailbox;
    v15[5] = MFImageGlyphInboxMailbox;
    v14[6] = &off_100541638;
    v14[7] = &off_100541650;
    v15[6] = MFImageGlyphArchiveMailbox;
    v15[7] = MFImageGlyphJunkMailbox;
    v7 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v15, v14, 8));
    v8 = (void *)qword_1005A9CE8;
    qword_1005A9CE8 = v7;

    v6 = (void *)qword_1005A9CE8;
  }
  if ((unint64_t)(a4 - 8) >= 0xFFFFFFFFFFFFFFF9)
    v9 = a4;
  else
    v9 = 0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v9));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v10));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage mf_systemImageNamed:forView:](UIImage, "mf_systemImageNamed:forView:", v11, 7));

  return v12;
}

- (id)iconFromBundle:(id)a3
{
  id v4;
  id v5;
  void *v6;

  v4 = a3;
  v5 = objc_msgSend((id)objc_opt_class(self), "iconFromBundle:forType:", v4, -[MFMailboxUid mailboxType](self, "mailboxType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return v6;
}

- (int)level
{
  uint64_t v2;
  void *v3;
  int v4;
  uint64_t v5;

  v2 = objc_claimAutoreleasedReturnValue(-[MFMailboxUid parent](self, "parent"));
  if (!v2)
    return 0;
  v3 = (void *)v2;
  v4 = 0;
  do
  {
    if (objc_msgSend(v3, "type") == (id)8)
      break;
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "parent"));
    ++v4;

    v3 = (void *)v5;
  }
  while (v5);

  return v4;
}

- (id)foundInDescriptionIncludingAccount:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;

  v3 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[MFMailboxUid displayNameUsingSpecialNames](self, "displayNameUsingSpecialNames"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("MAILBOX_SUFFIX"), &stru_100531B00, CFSTR("Main")));
  if ((objc_msgSend(v5, "hasSuffix:", v7) & 1) != 0)
  {
    v8 = 1;
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("BOX_SUFFIX"), &stru_100531B00, CFSTR("Main")));
    if ((objc_msgSend(v5, "hasSuffix:", v10) & 1) != 0)
    {
      v8 = 1;
    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("FOLDER_SUFFIX"), &stru_100531B00, CFSTR("Main")));
      v8 = objc_msgSend(v5, "hasSuffix:", v12);

    }
  }

  if (!v3)
    goto LABEL_12;
  v13 = (char *)-[MFMailboxUid type](self, "type");
  if ((unint64_t)(v13 - 2) >= 4 && v13 != (char *)7)
    goto LABEL_12;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailboxUid account](self, "account"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "displayName"));

  if (!v15
    || (v16 = sub_1000DD2D8(1, v8),
        v17 = (void *)objc_claimAutoreleasedReturnValue(v16),
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v17, v15, v5)),
        v17,
        v15,
        !v18))
  {
LABEL_12:
    v19 = sub_1000DD2D8(0, v8);
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v20, v5));

  }
  return v18;
}

- (id)tinyDisplayIconWithColor:(id)a3
{
  id v4;
  id v5;
  id *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v4 = a3;
  v5 = -[MFMailboxUid type](self, "type");
  v6 = (id *)&MFImageGlyphSentMailbox;
  if (v5 != (id)4)
    v6 = (id *)&MFImageGlyphGenericMailbox;
  v7 = *v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage mf_systemImageNamed:forView:](UIImage, "mf_systemImageNamed:forView:", v7, 19));
  v9 = v8;
  if (v4)
  {
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_flatImageWithColor:", v4));

    v9 = (void *)v10;
  }

  return v9;
}

- (BOOL)mv_isEditable
{
  return -[MFMailboxUid type](self, "type") == 0;
}

@end
