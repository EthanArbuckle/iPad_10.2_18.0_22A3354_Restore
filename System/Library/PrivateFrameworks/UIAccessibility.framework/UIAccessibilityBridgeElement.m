@implementation UIAccessibilityBridgeElement

- (void)overrideAccessibilityMethodsForRemoteDevice
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id obj;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[4];
  id v19;
  int v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  id location;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _QWORD v34[5];
  _QWORD v35[5];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  -[UIAccessibilityBridgeElement accessibilityActionsForRemoteDevice](self, "accessibilityActionsForRemoteDevice");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
  if (v17)
  {
    v16 = *(_QWORD *)v31;
    do
    {
      v3 = 0;
      do
      {
        if (*(_QWORD *)v31 != v16)
          objc_enumerationMutation(obj);
        v4 = objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * v3), "integerValue");
        v34[0] = &unk_1E3E10BB0;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", UIAccessibilityScrollToVisibleAction);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v35[0] = v5;
        v34[1] = &unk_1E3E10BC8;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", UIAccessibilityScrollUpPageAction);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v35[1] = v6;
        v34[2] = &unk_1E3E10BE0;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", UIAccessibilityScrollDownPageAction);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v35[2] = v7;
        v34[3] = &unk_1E3E10BF8;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", UIAccessibilityScrollLeftPageAction);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v35[3] = v8;
        v34[4] = &unk_1E3E10C10;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", UIAccessibilityScrollRightPageAction);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v35[4] = v9;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, v34, 5);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_initWeak(&location, self);
        switch((int)v4)
        {
          case 2003:
          case 2006:
          case 2007:
          case 2008:
          case 2009:
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v4);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "objectForKeyedSubscript:", v11);
            v12 = (void *)objc_claimAutoreleasedReturnValue();

            if (v12)
            {
              -[UIAccessibilityBridgeElement setIsAXScrollAncestor:](self, "setIsAXScrollAncestor:", 1);
              v13 = objc_msgSend(v12, "intValue");
              v18[0] = MEMORY[0x1E0C809B0];
              v18[1] = 3221225472;
              v18[2] = __75__UIAccessibilityBridgeElement_overrideAccessibilityMethodsForRemoteDevice__block_invoke_5;
              v18[3] = &unk_1E3DFFA80;
              objc_copyWeak(&v19, &location);
              v20 = v4;
              -[NSObject _accessibilitySetActionBlock:withValue:forKey:](self, "_accessibilitySetActionBlock:withValue:forKey:", v18, 0, v13);
              objc_destroyWeak(&v19);
            }

            break;
          case 2004:
            v23[0] = MEMORY[0x1E0C809B0];
            v23[1] = 3221225472;
            v23[2] = __75__UIAccessibilityBridgeElement_overrideAccessibilityMethodsForRemoteDevice__block_invoke_3;
            v23[3] = &unk_1E3DFFA30;
            objc_copyWeak(&v24, &location);
            -[NSObject _setAccessibilityIncrementBlock:](self, "_setAccessibilityIncrementBlock:", v23);
            objc_destroyWeak(&v24);
            break;
          case 2005:
            v21[0] = MEMORY[0x1E0C809B0];
            v21[1] = 3221225472;
            v21[2] = __75__UIAccessibilityBridgeElement_overrideAccessibilityMethodsForRemoteDevice__block_invoke_4;
            v21[3] = &unk_1E3DFFA30;
            objc_copyWeak(&v22, &location);
            -[NSObject _setAccessibilityDecrementBlock:](self, "_setAccessibilityDecrementBlock:", v21);
            objc_destroyWeak(&v22);
            break;
          case 2010:
            v27[0] = MEMORY[0x1E0C809B0];
            v27[1] = 3221225472;
            v27[2] = __75__UIAccessibilityBridgeElement_overrideAccessibilityMethodsForRemoteDevice__block_invoke;
            v27[3] = &unk_1E3DFFA58;
            objc_copyWeak(&v28, &location);
            -[NSObject _setAccessibilityActivateBlock:](self, "_setAccessibilityActivateBlock:", v27);
            objc_destroyWeak(&v28);
            break;
          case 2013:
            v25[0] = MEMORY[0x1E0C809B0];
            v25[1] = 3221225472;
            v25[2] = __75__UIAccessibilityBridgeElement_overrideAccessibilityMethodsForRemoteDevice__block_invoke_2;
            v25[3] = &unk_1E3DFFA58;
            objc_copyWeak(&v26, &location);
            -[NSObject _setAccessibilityPerformEscapeBlock:](self, "_setAccessibilityPerformEscapeBlock:", v25);
            objc_destroyWeak(&v26);
            break;
          default:
            break;
        }
        objc_destroyWeak(&location);

        ++v3;
      }
      while (v17 != v3);
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
      v17 = v14;
    }
    while (v14);
  }

}

uint64_t __75__UIAccessibilityBridgeElement_overrideAccessibilityMethodsForRemoteDevice__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  uint64_t v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "axActionHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "performAXAction:withValue:onBridgeElement:", 2010, 0, WeakRetained);

  return v3;
}

uint64_t __75__UIAccessibilityBridgeElement_overrideAccessibilityMethodsForRemoteDevice__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  uint64_t v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "axActionHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "performAXAction:withValue:onBridgeElement:", 2013, 0, WeakRetained);

  return v3;
}

void __75__UIAccessibilityBridgeElement_overrideAccessibilityMethodsForRemoteDevice__block_invoke_3(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "axActionHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "performAXAction:withValue:onBridgeElement:", 2004, 0, WeakRetained);

}

void __75__UIAccessibilityBridgeElement_overrideAccessibilityMethodsForRemoteDevice__block_invoke_4(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "axActionHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "performAXAction:withValue:onBridgeElement:", 2005, 0, WeakRetained);

}

uint64_t __75__UIAccessibilityBridgeElement_overrideAccessibilityMethodsForRemoteDevice__block_invoke_5(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "axActionHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "performAXAction:withValue:onBridgeElement:", *(unsigned int *)(a1 + 40), 0, WeakRetained);

  return v4;
}

- (NSData)elementRefData
{
  return self->_elementRefData;
}

- (void)setElementRefData:(id)a3
{
  objc_storeStrong((id *)&self->_elementRefData, a3);
}

- (UIAccessibilityBridgeAXActionHandler)axActionHandler
{
  return (UIAccessibilityBridgeAXActionHandler *)objc_loadWeakRetained((id *)&self->_axActionHandler);
}

- (void)setAxActionHandler:(id)a3
{
  objc_storeWeak((id *)&self->_axActionHandler, a3);
}

- (NSArray)accessibilityActionsForRemoteDevice
{
  return self->_accessibilityActionsForRemoteDevice;
}

- (void)setAccessibilityActionsForRemoteDevice:(id)a3
{
  objc_storeStrong((id *)&self->_accessibilityActionsForRemoteDevice, a3);
}

- (BOOL)isAXScrollAncestor
{
  return self->_isAXScrollAncestor;
}

- (void)setIsAXScrollAncestor:(BOOL)a3
{
  self->_isAXScrollAncestor = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessibilityActionsForRemoteDevice, 0);
  objc_destroyWeak((id *)&self->_axActionHandler);
  objc_storeStrong((id *)&self->_elementRefData, 0);
}

@end
