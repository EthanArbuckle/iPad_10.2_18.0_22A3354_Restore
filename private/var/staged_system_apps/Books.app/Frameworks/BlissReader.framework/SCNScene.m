@implementation SCNScene

- (id)p_groupNodes:(id)a3
{
  NSSet *v4;
  id v5;
  SCNNode *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v4 = +[NSSet setWithArray:](NSSet, "setWithArray:", objc_msgSend(a3, "valueForKey:", CFSTR("parentNode")));
  if ((char *)-[NSSet count](v4, "count") == (char *)&dword_0 + 1)
  {
    v5 = -[NSSet anyObject](v4, "anyObject");
    v6 = +[SCNNode node](SCNNode, "node");
    objc_msgSend(v5, "addChildNode:", v6);
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(a3);
          v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v11, "removeFromParentNode");
          -[SCNNode addChildNode:](v6, "addChildNode:", v11);
        }
        v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }
  }
  else
  {
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SCNScene(THAdditions) p_groupNodes:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Scene/SCNScene_THAdditions.m"), 33, CFSTR("Given nodes do not all have the same parent"));
    return 0;
  }
  return v6;
}

@end
