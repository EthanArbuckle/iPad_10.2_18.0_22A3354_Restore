@implementation WFContentItem(Previewing)

- (uint64_t)shouldUseObjectRepresentation
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v2 = objc_opt_class();
  if (v2 == objc_opt_class())
    return 0;
  objc_msgSend(a1, "preferredObjectType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "conformsToClass:", objc_opt_class()) & 1) != 0
    || (objc_msgSend(v3, "conformsToClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    objc_msgSend(a1, "internalRepresentationType");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "conformsToClass:", objc_opt_class()) & 1) != 0)
    {
      v4 = 1;
    }
    else
    {
      objc_msgSend(a1, "internalRepresentationType");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v6, "conformsToClass:", objc_opt_class());

    }
  }

  return v4;
}

- (void)prepareForPresentationWithCompletionHandler:()Previewing
{
  id v4;
  id *v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  if (objc_msgSend(a1, "shouldUseObjectRepresentation"))
  {
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __73__WFContentItem_Previewing__prepareForPresentationWithCompletionHandler___block_invoke;
    v11[3] = &unk_24EF603B8;
    v5 = &v12;
    v12 = v4;
    v6 = v4;
    objc_msgSend(a1, "preferredObjectType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "getObjectRepresentation:forClass:", v11, objc_msgSend(v7, "objectClass"));
  }
  else
  {
    v9 = MEMORY[0x24BDAC760];
    v5 = &v10;
    v10 = v4;
    v8 = v4;
    objc_msgSend(a1, "preferredFileType", v9, 3221225472, __73__WFContentItem_Previewing__prepareForPresentationWithCompletionHandler___block_invoke_2, &unk_24EF603E0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "getFileRepresentation:forType:", &v9, v7);
  }

}

@end
