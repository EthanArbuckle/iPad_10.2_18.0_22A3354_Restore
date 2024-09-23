@implementation ZN9Inspector33ObjCInspectorCSSBackendDispatcher23getMatchedStylesForNodeEliONSt3

uint64_t *___ZN9Inspector33ObjCInspectorCSSBackendDispatcher23getMatchedStylesForNodeEliONSt3__18optionalIbEES4__block_invoke_2(WTF::JSONImpl::Object *a1, void **a2, Inspector **a3, Inspector **a4)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  objc_class *v12;
  Inspector *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  uint64_t v18;
  void *v19;
  objc_class *v20;
  Inspector *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t k;
  uint64_t v26;
  void *v27;
  objc_class *v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  WTF::StringImpl *v34;
  _DWORD *v35;
  _DWORD *v36;
  WTF::StringImpl *v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t v42;
  WTF::StringImpl *v43;
  _DWORD *v44;
  _DWORD *v45;
  WTF::StringImpl *v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t v51;
  WTF::StringImpl *v52;
  _DWORD *v53;
  _DWORD *v54;
  WTF::StringImpl *v55;
  uint64_t *result;
  uint64_t v57;
  Inspector **v58;
  _DWORD *v61;
  _DWORD *v62;
  WTF::StringImpl *v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  uint64_t *v76;
  _QWORD v77[2];
  char v78;
  _BYTE v79[128];
  _BYTE v80[128];
  _BYTE v81[128];
  uint64_t v82;

  v82 = *MEMORY[0x24BDAC8D0];
  v57 = *((_QWORD *)a1 + 4);
  WTF::JSONImpl::Object::create(a1);
  v58 = (Inspector **)a2;
  if (a2)
  {
    v5 = *a2;
    if (!*a2)
    {
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("optional parameter '%@' cannot be nil"), CFSTR("matchedCSSRules"));
      v5 = *a2;
    }
    v74 = 0u;
    v75 = 0u;
    v72 = 0u;
    v73 = 0u;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v72, v81, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v73;
      v8 = *MEMORY[0x24BDBCAB8];
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v73 != v7)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v72 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v11 = (void *)MEMORY[0x24BDBCE88];
            v12 = (objc_class *)objc_opt_class();
            objc_msgSend(v11, "raise:format:", v8, CFSTR("array should contain objects of type '%@', found bad value: %@"), NSStringFromClass(v12), v10, v57);
          }
        }
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v72, v81, 16);
      }
      while (v6);
    }
  }
  if (a3)
  {
    v13 = *a3;
    if (!*a3)
    {
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("optional parameter '%@' cannot be nil"), CFSTR("pseudoElements"));
      v13 = *a3;
    }
    v71 = 0u;
    v69 = 0u;
    v70 = 0u;
    v68 = 0u;
    v14 = -[Inspector countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v68, v80, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v69;
      v16 = *MEMORY[0x24BDBCAB8];
      do
      {
        for (j = 0; j != v14; ++j)
        {
          if (*(_QWORD *)v69 != v15)
            objc_enumerationMutation(v13);
          v18 = *(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * j);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v19 = (void *)MEMORY[0x24BDBCE88];
            v20 = (objc_class *)objc_opt_class();
            objc_msgSend(v19, "raise:format:", v16, CFSTR("array should contain objects of type '%@', found bad value: %@"), NSStringFromClass(v20), v18);
          }
        }
        v14 = -[Inspector countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v68, v80, 16);
      }
      while (v14);
    }
  }
  if (a4)
  {
    v21 = *a4;
    if (!*a4)
    {
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("optional parameter '%@' cannot be nil"), CFSTR("inherited"));
      v21 = *a4;
    }
    v66 = 0u;
    v67 = 0u;
    v64 = 0u;
    v65 = 0u;
    v22 = -[Inspector countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v64, v79, 16);
    if (v22)
    {
      v23 = *(_QWORD *)v65;
      v24 = *MEMORY[0x24BDBCAB8];
      do
      {
        for (k = 0; k != v22; ++k)
        {
          if (*(_QWORD *)v65 != v23)
            objc_enumerationMutation(v21);
          v26 = *(_QWORD *)(*((_QWORD *)&v64 + 1) + 8 * k);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v27 = (void *)MEMORY[0x24BDBCE88];
            v28 = (objc_class *)objc_opt_class();
            objc_msgSend(v27, "raise:format:", v24, CFSTR("array should contain objects of type '%@', found bad value: %@"), NSStringFromClass(v28), v26);
          }
        }
        v22 = -[Inspector countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v64, v79, 16);
      }
      while (v22);
    }
  }
  if (v58)
  {
    v29 = v76;
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    v63 = (WTF::StringImpl *)v77[0];
    Inspector::toJSONObjectArray(*v58, (uint64_t *)&v61);
    v30 = (uint64_t)v61;
    v61 = 0;
    v62 = (_DWORD *)v30;
    WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>(v29 + 2, &v63, (uint64_t *)&v62, (uint64_t)v77);
    if (v78)
    {
      v31 = v29 + 3;
      v32 = *((unsigned int *)v29 + 9);
      if ((_DWORD)v32 == *((_DWORD *)v29 + 8))
      {
        WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v31, (unint64_t)&v63);
      }
      else
      {
        v33 = *v31;
        v34 = v63;
        if (v63)
          *(_DWORD *)v63 += 2;
        *(_QWORD *)(v33 + 8 * v32) = v34;
        *((_DWORD *)v29 + 9) = v32 + 1;
      }
    }
    v35 = v62;
    v62 = 0;
    if (v35)
    {
      if (*v35 == 1)
        WTF::JSONImpl::Value::operator delete();
      else
        --*v35;
    }
    v36 = v61;
    v61 = 0;
    if (v36)
    {
      if (*v36 == 1)
        WTF::JSONImpl::Value::operator delete();
      else
        --*v36;
    }
    v37 = v63;
    v63 = 0;
    if (v37)
    {
      if (*(_DWORD *)v37 == 2)
        WTF::StringImpl::destroy();
      else
        *(_DWORD *)v37 -= 2;
    }
  }
  if (a3)
  {
    v38 = v76;
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    v63 = (WTF::StringImpl *)v77[0];
    Inspector::toJSONObjectArray(*a3, (uint64_t *)&v61);
    v39 = (uint64_t)v61;
    v61 = 0;
    v62 = (_DWORD *)v39;
    WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>(v38 + 2, &v63, (uint64_t *)&v62, (uint64_t)v77);
    if (v78)
    {
      v40 = v38 + 3;
      v41 = *((unsigned int *)v38 + 9);
      if ((_DWORD)v41 == *((_DWORD *)v38 + 8))
      {
        WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v40, (unint64_t)&v63);
      }
      else
      {
        v42 = *v40;
        v43 = v63;
        if (v63)
          *(_DWORD *)v63 += 2;
        *(_QWORD *)(v42 + 8 * v41) = v43;
        *((_DWORD *)v38 + 9) = v41 + 1;
      }
    }
    v44 = v62;
    v62 = 0;
    if (v44)
    {
      if (*v44 == 1)
        WTF::JSONImpl::Value::operator delete();
      else
        --*v44;
    }
    v45 = v61;
    v61 = 0;
    if (v45)
    {
      if (*v45 == 1)
        WTF::JSONImpl::Value::operator delete();
      else
        --*v45;
    }
    v46 = v63;
    v63 = 0;
    if (v46)
    {
      if (*(_DWORD *)v46 == 2)
        WTF::StringImpl::destroy();
      else
        *(_DWORD *)v46 -= 2;
    }
  }
  if (a4)
  {
    v47 = v76;
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    v63 = (WTF::StringImpl *)v77[0];
    Inspector::toJSONObjectArray(*a4, (uint64_t *)&v61);
    v48 = (uint64_t)v61;
    v61 = 0;
    v62 = (_DWORD *)v48;
    WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>(v47 + 2, &v63, (uint64_t *)&v62, (uint64_t)v77);
    if (v78)
    {
      v49 = v47 + 3;
      v50 = *((unsigned int *)v47 + 9);
      if ((_DWORD)v50 == *((_DWORD *)v47 + 8))
      {
        WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v49, (unint64_t)&v63);
      }
      else
      {
        v51 = *v49;
        v52 = v63;
        if (v63)
          *(_DWORD *)v63 += 2;
        *(_QWORD *)(v51 + 8 * v50) = v52;
        *((_DWORD *)v47 + 9) = v50 + 1;
      }
    }
    v53 = v62;
    v62 = 0;
    if (v53)
    {
      if (*v53 == 1)
        WTF::JSONImpl::Value::operator delete();
      else
        --*v53;
    }
    v54 = v61;
    v61 = 0;
    if (v54)
    {
      if (*v54 == 1)
        WTF::JSONImpl::Value::operator delete();
      else
        --*v54;
    }
    v55 = v63;
    v63 = 0;
    if (v55)
    {
      if (*(_DWORD *)v55 == 2)
        WTF::StringImpl::destroy();
      else
        *(_DWORD *)v55 -= 2;
    }
  }
  Inspector::BackendDispatcher::sendResponse();
  result = v76;
  v76 = 0;
  if (result)
  {
    if (*(_DWORD *)result == 1)
      return (uint64_t *)WTF::JSONImpl::Value::operator delete();
    else
      --*(_DWORD *)result;
  }
  return result;
}

@end
