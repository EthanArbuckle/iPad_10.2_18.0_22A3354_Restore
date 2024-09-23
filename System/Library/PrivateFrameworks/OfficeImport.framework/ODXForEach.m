@implementation ODXForEach

+ (void)readNode:(_xmlNode *)a3 toForEach:(id)a4 state:(id)a5
{
  id v7;
  void *v8;
  id v9;

  v9 = a4;
  v7 = a5;
  objc_msgSend(v9, "iteratorSpecification");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[ODXIteratorSpecification readFromNode:toSpecification:state:](ODXIteratorSpecification, "readFromNode:toSpecification:state:", a3, v8, v7);

  +[ODXLayoutObjectList readNode:toList:state:](ODXLayoutObjectList, "readNode:toList:state:", a3, v9, v7);
}

@end
