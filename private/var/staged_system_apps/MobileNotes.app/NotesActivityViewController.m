@implementation NotesActivityViewController

- (BOOL)_shouldShowSystemActivityType:(id)a3
{
  id v3;
  unsigned __int8 v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", UIActivityTypeMessage) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", UIActivityTypeMail) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", UIActivityTypePrint) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v4 = objc_msgSend(v3, "isEqualToString:", UIActivityTypeCopyToPasteboard);
  }

  return v4;
}

- (void)_prepareActivity:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *j;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  uint64_t v29;
  void *i;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  _BYTE v55[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NotesActivityViewController displayController](self, "displayController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "note"));

  v7 = objc_opt_class(UIMessageActivity);
  if ((objc_opt_isKindOfClass(v4, v7) & 1) == 0)
  {
    v22 = objc_opt_class(UIMailActivity);
    if ((objc_opt_isKindOfClass(v4, v22) & 1) != 0)
    {
      v43 = v4;
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mailComposeViewController"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _systemInteractionTintColor](UIColor, "_systemInteractionTintColor"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "view"));
      objc_msgSend(v24, "_setInteractionTintColor:", v23);

      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "title"));
      objc_msgSend(v8, "setSubject:", v25);

      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "content"));
      objc_msgSend(v8, "setMessageBody:isHTML:", v26, objc_msgSend(v6, "isPlainText") ^ 1);

      v47 = 0u;
      v48 = 0u;
      v45 = 0u;
      v46 = 0u;
      v42 = v6;
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "attachments"));
      v27 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
      if (v27)
      {
        v28 = v27;
        v29 = *(_QWORD *)v46;
        do
        {
          for (i = 0; i != v28; i = (char *)i + 1)
          {
            if (*(_QWORD *)v46 != v29)
              objc_enumerationMutation(v12);
            v31 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * (_QWORD)i);
            v44 = 0;
            v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "attachmentDataWithError:", &v44));
            v33 = v44;
            if (v32)
            {
              v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "mimeType"));
              v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "filename"));

              objc_msgSend(v8, "addAttachmentData:mimeType:fileName:", v32, v34, v35);
            }
            else
            {
              v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "contentID"));
              v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "localizedDescription"));

              NSLog(CFSTR("Couldn't attach data to Mail for contentID: %@, error: %@"), v34, v35);
            }

          }
          v28 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
        }
        while (v28);
      }
      goto LABEL_24;
    }
    v36 = objc_opt_class(UICopyToPasteboardActivity);
    if ((objc_opt_isKindOfClass(v4, v36) & 1) != 0)
    {
      if (!objc_msgSend(v6, "isPlainText"))
      {
        v37 = (void *)objc_claimAutoreleasedReturnValue(-[NotesActivityViewController displayController](self, "displayController"));
        objc_msgSend(v37, "copyNoteHTMLToPasteboard");
        goto LABEL_33;
      }
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "contentAsPlainTextPreservingNewlines"));
      if (!v37)
      {
LABEL_33:

        goto LABEL_34;
      }
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "pasteboard"));
      objc_msgSend(v38, "setString:", v37);
    }
    else
    {
      v39 = objc_opt_class(UISocialActivity);
      if ((objc_opt_isKindOfClass(v4, v39) & 1) == 0)
        goto LABEL_34;
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "socialComposeViewController"));
      v40 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _systemInteractionTintColor](UIColor, "_systemInteractionTintColor"));
      v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "view"));
      objc_msgSend(v41, "_setInteractionTintColor:", v40);

      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "contentAsPlainTextPreservingNewlines"));
      objc_msgSend(v37, "setInitialText:", v38);
    }

    goto LABEL_33;
  }
  v43 = v4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "messageComposeViewController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _systemInteractionTintColor](UIColor, "_systemInteractionTintColor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "view"));
  objc_msgSend(v10, "_setInteractionTintColor:", v9);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "contentAsPlainTextPreservingNewlines"));
  objc_msgSend(v8, "setBody:", v11);

  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v42 = v6;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "attachments"));
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v51;
    do
    {
      for (j = 0; j != v14; j = (char *)j + 1)
      {
        if (*(_QWORD *)v51 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * (_QWORD)j);
        v49 = 0;
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "attachmentDataWithError:", &v49));
        v19 = v49;
        if (v18)
        {
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "mimeType"));
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "filename"));

          objc_msgSend(v8, "addAttachmentData:typeIdentifier:filename:", v18, v20, v21);
        }
        else
        {
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "contentID"));
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedDescription"));

          NSLog(CFSTR("Couldn't attach data to Message for contentID: %@, error: %@"), v20, v21);
        }

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
    }
    while (v14);
  }
LABEL_24:

  v6 = v42;
  v4 = v43;
LABEL_34:

}

- (NotesDisplayController)displayController
{
  return self->_displayController;
}

- (void)setDisplayController:(id)a3
{
  objc_storeStrong((id *)&self->_displayController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayController, 0);
}

@end
