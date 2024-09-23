@implementation INRunWorkflowIntent(Workflow)

- (uint64_t)initWithWorkflowReference:()Workflow
{
  return objc_msgSend(a1, "initWithWorkflowReference:includeIcon:", a3, 1);
}

- (uint64_t)initWithWorkflowReference:()Workflow includeIcon:
{
  return objc_msgSend(a1, "initWithWorkflowReference:includeIcon:iconDrawerContext:", a3, a4, 0);
}

- (void)initWithWorkflowReference:()Workflow includeIcon:iconDrawerContext:
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v32;

  v9 = a3;
  v10 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WFWorkflowReference+Intents.m"), 31, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("workflow"));

  }
  objc_msgSend(v9, "speakableString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(a1, "initWithWorkflow:", v11);

  if (v12)
  {
    objc_msgSend(v12, "_setLaunchId:", *MEMORY[0x1E0DC7FD8]);
    objc_msgSend(v9, "name");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setSuggestedInvocationPhrase:", v13);

    if (a4)
    {
      objc_msgSend(v9, "associatedAppBundleIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "length");

      if (!v15)
        goto LABEL_14;
      objc_msgSend(v9, "associatedAppBundleIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBD728]), "initWithBundleIdentifier:", v16);
      if ((objc_msgSend(v17, "isInstalled") & 1) != 0)
      {
        v18 = v17;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CBD758], "sharedResolver");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "resolvedAppMatchingDescriptor:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v18, "isInstalled"))
        {
          objc_msgSend(v18, "bundleIdentifier");
          v20 = objc_claimAutoreleasedReturnValue();

          v16 = (void *)v20;
        }
      }
      objc_msgSend(MEMORY[0x1E0DC7B70], "applicationIconImageForBundleIdentifier:format:", v16, 2);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "PNGRepresentation");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v22)
      {
        objc_msgSend(MEMORY[0x1E0CBD958], "imageWithImageData:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v23 = 0;
      }

      if (!v23)
      {
LABEL_14:
        v24 = objc_alloc(MEMORY[0x1E0DC7E40]);
        objc_msgSend(v9, "icon");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = (void *)objc_msgSend(v24, "initWithIcon:drawerContext:", v25, v10);

        objc_msgSend(v26, "setCornerRadius:", 8.0);
        v27 = (void *)MEMORY[0x1E0CBD958];
        objc_msgSend(v26, "imageWithSize:", 60.0, 60.0);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "PNGRepresentation");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "imageWithImageData:", v29);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend(v12, "setImage:forParameterNamed:", v23, CFSTR("workflow"));

    }
    v30 = v12;
  }

  return v12;
}

- (id)workflowForIntentInDatabase:()Workflow
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(a1, "workflow");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "spokenPhrase");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "workflow");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "vocabularyIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v8, "length")
    || (objc_msgSend(v4, "referenceForWorkflowID:", v8), (v9 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    if (objc_msgSend(v6, "length"))
    {
      objc_msgSend(v4, "uniqueVisibleReferenceForWorkflowName:", v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (void)setIconForAssociatedApplicationInWorkflow:()Workflow
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = (void *)MEMORY[0x1E0DC7B70];
  objc_msgSend(a3, "associatedAppBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "applicationIconImageForBundleIdentifier:format:", v5, 2);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0CBD958];
  objc_msgSend(v9, "PNGRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "imageWithImageData:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "setImage:forParameterNamed:", v8, CFSTR("workflow"));
}

@end
