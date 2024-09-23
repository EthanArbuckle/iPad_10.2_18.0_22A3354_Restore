@implementation XBApplicationCaptureInformation

- (XBApplicationCaptureInformation)initWithLaunchRequests:(id)a3 captureInfos:(id)a4 launchImagePaths:(id)a5
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  XBApplicationCaptureInformation *v14;
  XBApplicationCaptureInformation *v15;
  void *v17;
  objc_super v18;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = objc_msgSend(v10, "count");
  if (v13 != objc_msgSend(v11, "count"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("XBApplicationCaptureInformation.m"), 61, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[launchRequests count] == [captureInfos count]"));

  }
  v18.receiver = self;
  v18.super_class = (Class)XBApplicationCaptureInformation;
  v14 = -[XBApplicationCaptureInformation init](&v18, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_launchRequests, a3);
    objc_storeStrong((id *)&v15->_captureInfos, a4);
    objc_storeStrong((id *)&v15->_launchImagePaths, a5);
  }

  return v15;
}

- (unint64_t)estimatedMemoryImpactForLaunchRequest:(id)a3
{
  NSUInteger v4;
  void *v6;
  unint64_t v7;

  v4 = -[NSOrderedSet indexOfObject:](self->_launchRequests, "indexOfObject:", a3);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
    return -1;
  -[NSArray objectAtIndexedSubscript:](self->_captureInfos, "objectAtIndexedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "estimatedMemoryImpact");

  return v7;
}

- (id)launchImagePathForLaunchRequest:(id)a3
{
  NSUInteger v4;
  void *v5;

  v4 = -[NSOrderedSet indexOfObject:](self->_launchRequests, "indexOfObject:", a3);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = 0;
  }
  else
  {
    -[NSArray objectAtIndexedSubscript:](self->_launchImagePaths, "objectAtIndexedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)caarPathForLaunchRequest:(id)a3
{
  NSUInteger v4;
  void *v5;
  void *v6;

  v4 = -[NSOrderedSet indexOfObject:](self->_launchRequests, "indexOfObject:", a3);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = 0;
  }
  else
  {
    -[NSArray objectAtIndexedSubscript:](self->_captureInfos, "objectAtIndexedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "caarFilePath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (NSString)description
{
  return (NSString *)-[XBApplicationCaptureInformation descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[XBApplicationCaptureInformation descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  NSOrderedSet *obj;
  _QWORD v14[6];
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  -[XBApplicationCaptureInformation succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  obj = self->_launchRequests;
  v5 = -[NSOrderedSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v9, "succinctDescription");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "activeMultilinePrefix");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v14[0] = MEMORY[0x24BDAC760];
        v14[1] = 3221225472;
        v14[2] = __73__XBApplicationCaptureInformation_descriptionBuilderWithMultilinePrefix___block_invoke;
        v14[3] = &unk_24D7F4050;
        v14[4] = self;
        v14[5] = v9;
        v15 = v4;
        objc_msgSend(v15, "appendBodySectionWithName:multilinePrefix:block:", v10, v11, v14);

      }
      v6 = -[NSOrderedSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }

  return v4;
}

void __73__XBApplicationCaptureInformation_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  const __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v2 = objc_msgSend(*(id *)(a1 + 32), "estimatedMemoryImpactForLaunchRequest:", *(_QWORD *)(a1 + 40));
  if (v2)
  {
    if (v2 != -1)
    {
      v5 = *(void **)(a1 + 48);
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%zu bytes"), objc_msgSend(*(id *)(a1 + 32), "estimatedMemoryImpactForLaunchRequest:", *(_QWORD *)(a1 + 40)));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "appendString:withName:", v6, CFSTR("Estimated Memory Impact"));

      goto LABEL_7;
    }
    v3 = *(void **)(a1 + 48);
    v4 = CFSTR("Undefined!");
  }
  else
  {
    v3 = *(void **)(a1 + 48);
    v4 = CFSTR("Minimal");
  }
  objc_msgSend(v3, "appendString:withName:", v4, CFSTR("Estimated Memory Impact"));
LABEL_7:
  v7 = *(void **)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "launchImagePathForLaunchRequest:", *(_QWORD *)(a1 + 40));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendString:withName:", v8, CFSTR("Path"));

  v9 = *(void **)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "caarPathForLaunchRequest:", *(_QWORD *)(a1 + 40));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendString:withName:skipIfEmpty:", v10, CFSTR(".caar Path"), 1);

}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[XBApplicationCaptureInformation succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x24BE38380], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSOrderedSet firstObject](self->_launchRequests, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "groupID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v5, CFSTR("groupID"));

  v6 = (id)objc_msgSend(v3, "appendUnsignedInteger:withName:", -[NSOrderedSet count](self->_launchRequests, "count"), CFSTR("launchRequests"));
  return v3;
}

- (NSOrderedSet)launchRequests
{
  return self->_launchRequests;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_launchRequests, 0);
  objc_storeStrong((id *)&self->_launchImagePaths, 0);
  objc_storeStrong((id *)&self->_captureInfos, 0);
}

@end
