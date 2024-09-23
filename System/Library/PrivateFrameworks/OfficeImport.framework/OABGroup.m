@implementation OABGroup

+ (id)readGroup:(id)a3 state:(id)a4
{
  id v5;
  id v6;
  EshContentProperties *v7;
  void *v8;
  uint64_t v9;
  OADGroup *v10;
  OADGroup *v11;
  void *v12;
  id v13;
  int *var2;
  void *v15;
  id v16;

  v5 = a3;
  v6 = a4;
  v7 = (EshContentProperties *)objc_msgSend(v5, "eshGroup");
  if (!v7)
  {
    v11 = 0;
    goto LABEL_11;
  }
  if (!objc_msgSend((id)objc_msgSend(v6, "client"), "xmlEquivalentOfDrawableCanBeUsed")
    || !EshContentProperties::isXmlEquivalentSet(v7 + 12))
  {
LABEL_10:
    v11 = objc_alloc_init(OADGroup);
    +[OABContent readFromContainer:toDrawable:state:](OABContent, "readFromContainer:toDrawable:state:", v5, v11, v6);
    var2 = (int *)v7[11].var2;
    -[OADGroup setLogicalBounds:](v11, "setLogicalBounds:", (double)var2[7], (double)var2[8], (double)(var2[9] - var2[7]), (double)(var2[10] - var2[8]));
    objc_msgSend(v6, "pushGroup:", v11);
    +[OABDrawable readDrawablesFromContainer:state:](OABDrawable, "readDrawablesFromContainer:state:", v5, v6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[OADGroup addChildren:](v11, "addChildren:", v15);

    v16 = (id)objc_msgSend(v6, "popGroup");
    objc_msgSend((id)objc_msgSend(v6, "client"), "readClientDataFromGroup:toGroup:state:", v5, v11, v6);
    goto LABEL_11;
  }
  +[OABDrawable readDrawableFromZipPackageData:foundInObject:state:](OABDrawable, "readDrawableFromZipPackageData:foundInObject:state:", EshContentProperties::getXmlEquivalent(v7 + 12), v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_class();
  TSUDynamicCast(v9, (uint64_t)v8);
  v10 = (OADGroup *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10)
  {

    goto LABEL_10;
  }
  if (!-[OADGroup childCount](v10, "childCount"))
  {
    objc_msgSend(v6, "pushGroup:", v11);
    +[OABDrawable readDrawablesFromContainer:state:](OABDrawable, "readDrawablesFromContainer:state:", v5, v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[OADGroup addChildren:](v11, "addChildren:", v12);

    v13 = (id)objc_msgSend(v6, "popGroup");
  }

LABEL_11:
  return v11;
}

@end
