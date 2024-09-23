@implementation OAVGroup

+ (id)readFromGroup:(_xmlNode *)a3 inNamespace:(id)a4 state:(id)a5
{
  id v7;
  id v8;
  OADGroup *v9;
  void *v10;

  v7 = a4;
  v8 = a5;
  v9 = objc_alloc_init(OADGroup);
  +[OAVDrawable readFromDrawable:toDrawable:state:](OAVDrawable, "readFromDrawable:toDrawable:state:", a3, v9, v8);
  +[OAVDrawable readDrawablesFromParent:inNamespace:state:](OAVDrawable, "readDrawablesFromParent:inNamespace:state:", a3, v7, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[OADGroup addChildren:](v9, "addChildren:", v10);

  +[OAVDrawable readCoordBounds:](OAVDrawable, "readCoordBounds:", a3);
  -[OADGroup setLogicalBounds:](v9, "setLogicalBounds:");
  objc_msgSend((id)objc_msgSend(v8, "client"), "readClientDataFromGroup:toGroup:state:", a3, v9, v8);

  return v9;
}

@end
