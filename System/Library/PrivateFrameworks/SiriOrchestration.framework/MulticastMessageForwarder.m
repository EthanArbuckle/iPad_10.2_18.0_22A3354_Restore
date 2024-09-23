@implementation MulticastMessageForwarder

- (MulticastMessageForwarder)init
{
  MulticastMessageForwarder *v2;
  uint64_t v3;
  NSMutableArray *receivers;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MulticastMessageForwarder;
  v2 = -[MulticastMessageForwarder init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    receivers = v2->_receivers;
    v2->_receivers = (NSMutableArray *)v3;

  }
  return v2;
}

- (void)addReceiver:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  Receiver *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  -[MulticastMessageForwarder receivers](self, "receivers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __41__MulticastMessageForwarder_addReceiver___block_invoke;
  v10[3] = &unk_251858330;
  v9 = v4;
  v11 = v9;
  v6 = objc_msgSend(v5, "indexOfObjectPassingTest:", v10);

  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    -[MulticastMessageForwarder receivers](self, "receivers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[Receiver initWithWrappedObject:]([Receiver alloc], "initWithWrappedObject:", v9);
    objc_msgSend(v7, "addObject:", v8);

  }
  -[MulticastMessageForwarder cleanupNilReceivers](self);

}

BOOL __41__MulticastMessageForwarder_addReceiver___block_invoke(uint64_t a1, void *a2, uint64_t a3, BOOL *a4)
{
  void *v6;

  objc_msgSend(a2, "wrappedObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *a4 = v6 == *(void **)(a1 + 32);

  return *a4;
}

- (void)cleanupNilReceivers
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  if (a1)
  {
    objc_msgSend(MEMORY[0x24BDD1698], "indexSet");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "receivers");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __48__MulticastMessageForwarder_cleanupNilReceivers__block_invoke;
    v6[3] = &unk_251858358;
    v5 = v2;
    v7 = v5;
    objc_msgSend(v3, "enumerateObjectsUsingBlock:", v6);

    if (objc_msgSend(v5, "count"))
    {
      objc_msgSend(a1, "receivers");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "removeObjectsAtIndexes:", v5);

    }
  }
}

- (void)removeReceiver:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[MulticastMessageForwarder receivers](self, "receivers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __44__MulticastMessageForwarder_removeReceiver___block_invoke;
  v9[3] = &unk_251858330;
  v10 = v4;
  v8 = v4;
  v6 = objc_msgSend(v5, "indexOfObjectPassingTest:", v9);

  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[MulticastMessageForwarder receivers](self, "receivers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObjectAtIndex:", v6);

  }
  -[MulticastMessageForwarder cleanupNilReceivers](self);

}

BOOL __44__MulticastMessageForwarder_removeReceiver___block_invoke(uint64_t a1, void *a2, uint64_t a3, BOOL *a4)
{
  void *v6;

  objc_msgSend(a2, "wrappedObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *a4 = v6 == *(void **)(a1 + 32);

  return *a4;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  char v9;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[MulticastMessageForwarder receivers](self, "receivers", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "wrappedObject");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_opt_respondsToSelector();

        if ((v9 & 1) != 0)
        {
          v10 = 1;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v5)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[MulticastMessageForwarder receivers](self, "receivers", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v9, "wrappedObject");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_opt_respondsToSelector();

        if ((v11 & 1) != 0)
        {
          objc_msgSend(v9, "wrappedObject");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "methodSignatureForSelector:", a3);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v6)
        continue;
      break;
    }
  }
  v12 = 0;
LABEL_11:

  return v12;
}

- (void)forwardInvocation:(id)a3
{
  uint64_t v3;
  id v5;
  const char *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  _BYTE *v16;
  unsigned int v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  const char *v22;
  void *v23;
  void *v24;
  MulticastMessageForwarder *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  id obj;
  void *v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (const char *)objc_msgSend(v5, "selector");
  objc_msgSend(v5, "methodSignature");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v25 = self;
  -[MulticastMessageForwarder receivers](self, "receivers");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v33;
    v26 = *(_QWORD *)v33;
    v28 = v7;
    do
    {
      v11 = 0;
      v27 = v9;
      do
      {
        if (*(_QWORD *)v33 != v10)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * v11), "wrappedObject");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12 && (objc_opt_respondsToSelector() & 1) != 0)
        {
          v30 = v12;
          objc_msgSend(MEMORY[0x24BDBCE98], "invocationWithMethodSignature:", v7);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setSelector:", v6);
          if ((unint64_t)objc_msgSend(v7, "numberOfArguments") >= 3)
          {
            v14 = 2;
            while (2)
            {
              v15 = objc_retainAutorelease(v7);
              v16 = (_BYTE *)objc_msgSend(v15, "getArgumentTypeAtIndex:", v14);
              v17 = *v16;
              if (v17 > 0x5D)
              {
                switch(*v16)
                {
                  case '^':
                  case 'd':
                    goto LABEL_21;
                  case '_':
                  case 'a':
                  case 'b':
                  case 'e':
                  case 'g':
                  case 'h':
                    goto LABEL_20;
                  case 'c':
                    goto LABEL_13;
                  case 'f':
                  case 'i':
                    goto LABEL_14;
                  default:
                    if (v17 == 113)
                      goto LABEL_21;
                    if (v17 == 115)
                      goto LABEL_17;
                    goto LABEL_20;
                }
              }
              switch(*v16)
              {
                case '@':
                  goto LABEL_21;
                case 'A':
                case 'D':
                case 'E':
                case 'F':
                case 'G':
                case 'H':
                  goto LABEL_20;
                case 'B':
                case 'C':
LABEL_13:
                  LOBYTE(v31) = 0;
                  goto LABEL_22;
                case 'I':
LABEL_14:
                  LODWORD(v31) = 0;
                  goto LABEL_22;
                default:
                  if (v17 == 81)
                  {
LABEL_21:
                    v31 = 0;
                  }
                  else
                  {
                    if (v17 != 83)
                    {
LABEL_20:
                      v18 = v13;
                      v19 = (void *)MEMORY[0x24BDBCE88];
                      NSStringFromSelector(v6);
                      v20 = v3;
                      v21 = v5;
                      v22 = v6;
                      v23 = (void *)objc_claimAutoreleasedReturnValue();
                      v24 = v19;
                      v13 = v18;
                      objc_msgSend(v24, "raise:format:", CFSTR("UnsupportedArgument"), CFSTR("Selector %@ has unsupported argument typed %s at index %lu"), v23, v16, v14);

                      v6 = v22;
                      v5 = v21;
                      v3 = v20;
                      v7 = v28;
                      goto LABEL_23;
                    }
LABEL_17:
                    LOWORD(v31) = 0;
                  }
LABEL_22:
                  objc_msgSend(v5, "getArgument:atIndex:", &v31, v14);
                  objc_msgSend(v13, "setArgument:atIndex:", &v31, v14);
LABEL_23:
                  if (++v14 >= (unint64_t)objc_msgSend(v15, "numberOfArguments"))
                    break;
                  continue;
              }
              break;
            }
          }
          v12 = v30;
          objc_msgSend(v13, "invokeWithTarget:", v30);

          v10 = v26;
          v9 = v27;
        }

        ++v11;
      }
      while (v11 != v9);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v9);
  }

  -[MulticastMessageForwarder cleanupNilReceivers](v25);
}

void __48__MulticastMessageForwarder_cleanupNilReceivers__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;

  objc_msgSend(a2, "wrappedObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    objc_msgSend(*(id *)(a1 + 32), "addIndex:", a3);
}

- (NSMutableArray)receivers
{
  return self->_receivers;
}

- (void)setReceivers:(id)a3
{
  objc_storeStrong((id *)&self->_receivers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_receivers, 0);
}

@end
