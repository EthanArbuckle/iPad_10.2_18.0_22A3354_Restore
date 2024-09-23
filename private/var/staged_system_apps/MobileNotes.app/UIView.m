@implementation UIView

- (id)_icaxKeyboardImpl
{
  Class v3;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v3 = NSClassFromString(CFSTR("UIKeyboardImpl"));
  if ((objc_opt_isKindOfClass(self, v3) & 1) != 0)
    return self;
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UIView subviews](self, "subviews", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v9), "_icaxKeyboardImpl"));
        if (v10)
        {
          v11 = (void *)v10;

          return v11;
        }
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
        continue;
      break;
    }
  }

  return 0;
}

- (void)ic_addCreateNoteInteractionWithFolderHandler:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  unint64_t v8;
  UIView *v9;
  id v10;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject(&unk_10056ED30, 24, 7);
  *(_QWORD *)(v5 + 16) = v4;
  v6 = swift_allocObject(&unk_10056ED58, 32, 7);
  *(_QWORD *)(v6 + 16) = sub_100285ED8;
  *(_QWORD *)(v6 + 24) = v5;
  v7 = objc_allocWithZone((Class)type metadata accessor for UIAppIntentInteraction(0));
  v8 = sub_10017C638();
  v9 = self;
  swift_retain(v5);
  v10 = (id)UIAppIntentInteraction.init<A>(intent:perform:)(&type metadata for CreateNoteIntent, &unk_1005DCC88, v6, &type metadata for CreateNoteIntent, v8);
  -[UIView addInteraction:](v9, "addInteraction:", v10);

  swift_release(v5);
}

- (void)ic_addSetParagraphStyleInteractionWithStyleHandler:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  unint64_t v8;
  UIView *v9;
  id v10;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject(&unk_10056ECE0, 24, 7);
  *(_QWORD *)(v5 + 16) = v4;
  v6 = swift_allocObject(&unk_10056ED08, 32, 7);
  *(_QWORD *)(v6 + 16) = sub_100166BB0;
  *(_QWORD *)(v6 + 24) = v5;
  v7 = objc_allocWithZone((Class)type metadata accessor for UIAppIntentInteraction(0));
  v8 = sub_1001B2C28();
  v9 = self;
  swift_retain(v5);
  v10 = (id)UIAppIntentInteraction.init<A>(intent:perform:)(&type metadata for SetParagraphStyleIntent, &unk_1005DCC70, v6, &type metadata for SetParagraphStyleIntent, v8);
  -[UIView addInteraction:](v9, "addInteraction:", v10);

  swift_release(v5);
}

- (void)ic_addReplaceSelectionInteractionWithTextHandler:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  unint64_t v8;
  UIView *v9;
  id v10;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject(&unk_10056EC90, 24, 7);
  *(_QWORD *)(v5 + 16) = v4;
  v6 = swift_allocObject(&unk_10056ECB8, 32, 7);
  *(_QWORD *)(v6 + 16) = sub_100166BB0;
  *(_QWORD *)(v6 + 24) = v5;
  v7 = objc_allocWithZone((Class)type metadata accessor for UIAppIntentInteraction(0));
  v8 = sub_1001B2B5C();
  v9 = self;
  swift_retain(v5);
  v10 = (id)UIAppIntentInteraction.init<A>(intent:perform:)(&type metadata for ReplaceSelectionIntent, &unk_1005DCC50, v6, &type metadata for ReplaceSelectionIntent, v8);
  -[UIView addInteraction:](v9, "addInteraction:", v10);

  swift_release(v5);
}

- (void)ic_removeLinkActionInteractions
{
  UIView *v2;

  v2 = self;
  sub_1003DD890();

}

- (void)ic_annotateWithNote:(id)a3
{
  id v5;
  UIView *v6;

  v5 = a3;
  v6 = self;
  sub_1003DD9F8(a3);

}

- (void)ic_annotateWithFolder:(id)a3
{
  id v5;
  UIView *v6;

  v5 = a3;
  v6 = self;
  sub_1003DDC58(a3);

}

- (void)ic_annotateWithAccount:(id)a3
{
  id v5;
  UIView *v6;

  v5 = a3;
  v6 = self;
  sub_1003DDEB8(a3);

}

- (void)ic_annotateWithNoteContainer:(id)a3
{
  id v5;
  UIView *v6;

  v5 = a3;
  v6 = self;
  sub_1003DE118((uint64_t)a3);

}

- (void)ic_annotateWithTag:(id)a3
{
  id v5;
  UIView *v6;

  v5 = a3;
  v6 = self;
  sub_1003DE250(a3);

}

- (void)ic_annotateWithAttachment:(id)a3
{
  id v5;
  UIView *v6;

  v5 = a3;
  v6 = self;
  sub_1003DE4A0(a3);

}

- (void)ic_annotateWithTable:(id)a3
{
  id v5;
  UIView *v6;

  v5 = a3;
  v6 = self;
  sub_1003DE700(a3);

}

@end
