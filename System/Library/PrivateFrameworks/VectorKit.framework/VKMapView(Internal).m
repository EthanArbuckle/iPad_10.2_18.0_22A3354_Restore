@implementation VKMapView(Internal)

- (void)populateDebugNode:()Internal withOptions:
{
  id v3;
  uint64_t v4;
  const char *v5;
  size_t v6;
  size_t v7;
  __int128 *p_dst;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  const char *v21;
  size_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  const char *v29;
  size_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  int v35;
  uint64_t v36;
  uint64_t v38;
  uint64_t v40;
  id obj;
  id v42;
  uint64_t v43;
  void *v44;
  id v45;
  _BYTE v46[32];
  __int128 v47;
  unint64_t v48;
  int v49;
  void *v50[2];
  unint64_t v51;
  _BYTE v52[32];
  __int128 __p;
  unint64_t v54;
  int v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 __dst;
  unint64_t v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _BYTE v66[128];
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v3 = *a2;
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  obj = v3;
  v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v67, 16);
  if (v40)
  {
    v38 = *(_QWORD *)v63;
    do
    {
      v43 = 0;
      do
      {
        if (*(_QWORD *)v63 != v38)
          objc_enumerationMutation(obj);
        v4 = *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * v43);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v4);
        v42 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v5 = (const char *)objc_msgSend(v42, "UTF8String");
        v6 = strlen(v5);
        if (v6 > 0x7FFFFFFFFFFFFFF7)
          abort();
        v7 = v6;
        if (v6 >= 0x17)
        {
          v9 = (v6 & 0xFFFFFFFFFFFFFFF8) + 8;
          if ((v6 | 7) != 0x17)
            v9 = v6 | 7;
          v10 = v9 + 1;
          p_dst = (__int128 *)operator new(v9 + 1);
          *((_QWORD *)&__dst + 1) = v7;
          v61 = v10 | 0x8000000000000000;
          *(_QWORD *)&__dst = p_dst;
LABEL_13:
          memmove(p_dst, v5, v7);
          goto LABEL_14;
        }
        HIBYTE(v61) = v6;
        p_dst = &__dst;
        if (v6)
          goto LABEL_13;
LABEL_14:
        *((_BYTE *)p_dst + v7) = 0;
        objc_msgSend(obj, "objectForKey:", v4);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v11 = gdc::DebugTreeNode::createChildNode(a3, &__dst);
          v12 = v44;
          v13 = *(_QWORD *)(a1 + 8);
          v45 = v12;
          v50[0] = v45;
          v14 = *(_QWORD *)(v13 + 24);
          if (!v14)
          {
            std::__throw_bad_function_call[abi:nn180100]();
            __break(1u);
          }
          (*(void (**)(uint64_t, void **, char *))(*(_QWORD *)v14 + 48))(v14, v50, v11);

          goto LABEL_55;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v15 = gdc::DebugTreeNode::createChildNode(a3, &__dst);
          v16 = v44;
          v56 = 0u;
          v57 = 0u;
          v58 = 0u;
          v59 = 0u;
          v45 = v16;
          v17 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v56, v66, 16);
          if (!v17)
            goto LABEL_41;
          v18 = *(_QWORD *)v57;
          while (1)
          {
            v19 = 0;
            do
            {
              if (*(_QWORD *)v57 != v18)
                objc_enumerationMutation(v45);
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * v19));
              v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
              v21 = (const char *)objc_msgSend(v20, "UTF8String");
              v22 = strlen(v21);
              if (v22 > 0x7FFFFFFFFFFFFFF7)
                abort();
              v23 = (void *)v22;
              if (v22 >= 0x17)
              {
                v25 = (v22 & 0xFFFFFFFFFFFFFFF8) + 8;
                if ((v22 | 7) != 0x17)
                  v25 = v22 | 7;
                v26 = v25 + 1;
                v24 = operator new(v25 + 1);
                v50[1] = v23;
                v51 = v26 | 0x8000000000000000;
                v50[0] = v24;
LABEL_30:
                memmove(v24, v21, (size_t)v23);
                goto LABEL_31;
              }
              HIBYTE(v51) = v22;
              v24 = v50;
              if (v22)
                goto LABEL_30;
LABEL_31:
              *((_BYTE *)v23 + (_QWORD)v24) = 0;
              __p = 0uLL;
              v54 = 0;
              v55 = 4;
              v27 = SHIBYTE(v51);
              if (SHIBYTE(v51) < 0)
              {
                std::string::__assign_no_alias<true>(&__p, v50[0], (size_t)v50[1]);
              }
              else
              {
                __p = *(_OWORD *)v50;
                v54 = v51;
              }
              gdc::DebugTreeNode::addProperty((uint64_t)v15, (uint64_t)&__dst, (uint64_t)v52);
              if (SHIBYTE(v54) < 0)
              {
                operator delete((void *)__p);
                if ((v27 & 0x80000000) == 0)
                  goto LABEL_36;
              }
              else if ((v27 & 0x80000000) == 0)
              {
                goto LABEL_36;
              }
              operator delete(v50[0]);
LABEL_36:

              ++v19;
            }
            while (v17 != v19);
            v28 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v56, v66, 16);
            v17 = v28;
            if (!v28)
            {
LABEL_41:

              goto LABEL_55;
            }
          }
        }
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v44);
        v45 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v29 = (const char *)objc_msgSend(v45, "UTF8String");
        v30 = strlen(v29);
        if (v30 > 0x7FFFFFFFFFFFFFF7)
          abort();
        v31 = (void *)v30;
        if (v30 >= 0x17)
        {
          v33 = (v30 & 0xFFFFFFFFFFFFFFF8) + 8;
          if ((v30 | 7) != 0x17)
            v33 = v30 | 7;
          v34 = v33 + 1;
          v32 = operator new(v33 + 1);
          v50[1] = v31;
          v51 = v34 | 0x8000000000000000;
          v50[0] = v32;
        }
        else
        {
          HIBYTE(v51) = v30;
          v32 = v50;
          if (!v30)
            goto LABEL_50;
        }
        memmove(v32, v29, (size_t)v31);
LABEL_50:
        *((_BYTE *)v31 + (_QWORD)v32) = 0;
        v47 = 0uLL;
        v48 = 0;
        v49 = 4;
        v35 = SHIBYTE(v51);
        if (SHIBYTE(v51) < 0)
        {
          std::string::__assign_no_alias<true>(&v47, v50[0], (size_t)v50[1]);
        }
        else
        {
          v47 = *(_OWORD *)v50;
          v48 = v51;
        }
        gdc::DebugTreeNode::addProperty(a3, (uint64_t)&__dst, (uint64_t)v46);
        if (SHIBYTE(v48) < 0)
        {
          operator delete((void *)v47);
          if ((v35 & 0x80000000) == 0)
            goto LABEL_55;
        }
        else if ((v35 & 0x80000000) == 0)
        {
          goto LABEL_55;
        }
        operator delete(v50[0]);
LABEL_55:

        if (SHIBYTE(v61) < 0)
          operator delete((void *)__dst);

        ++v43;
      }
      while (v43 != v40);
      v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v67, 16);
      v40 = v36;
    }
    while (v36);
  }

}

- (_QWORD)populateDebugNode:()Internal withOptions:
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_1E42C7CA0;
  result[1] = v3;
  return result;
}

- (uint64_t)populateDebugNode:()Internal withOptions:
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &off_1E42C7CA0;
  a2[1] = v2;
  return result;
}

@end
