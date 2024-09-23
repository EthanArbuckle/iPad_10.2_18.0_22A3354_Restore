@implementation REScriptASTNodeEnumerator

- (REScriptASTNodeEnumerator)initWithRootNodes:(id)a3 symbolTable:(id)a4
{
  id v7;
  id v8;
  REScriptASTNodeEnumerator *v9;
  REScriptASTNodeEnumerator *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)REScriptASTNodeEnumerator;
  v9 = -[REScriptASTNodeEnumerator init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_nodes, a3);
    objc_storeStrong((id *)&v10->_table, a4);
  }

  return v10;
}

- (BOOL)buildSymbolTableWithError:(id *)a3
{
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  REScriptSymbolTable *table;
  void *v12;
  void *v13;
  void *v14;
  REScriptSymbolTable *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  REScriptSymbolTable *v21;
  void *v22;
  void *v23;
  REScriptSymbolTable *v24;
  void *v25;
  void *v26;
  id v27;
  REScriptSymbolTable *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  REScriptSymbolTable *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  char isKindOfClass;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  unint64_t v46;
  REScriptSymbolTable *v47;
  void *v48;
  int v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  BOOL v60;
  void *v62;
  void *v63;
  NSArray *obj;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  const __CFString *v72;
  void *v73;
  const __CFString *v74;
  void *v75;
  const __CFString *v76;
  void *v77;
  const __CFString *v78;
  void *v79;
  const __CFString *v80;
  void *v81;
  _BYTE v82[128];
  uint64_t v83;

  v83 = *MEMORY[0x24BDAC8D0];
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  obj = self->_nodes;
  v66 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v68, v82, 16);
  if (!v66)
  {
    v60 = 1;
    goto LABEL_55;
  }
  v65 = *(_QWORD *)v69;
  do
  {
    v5 = 0;
    do
    {
      if (*(_QWORD *)v69 != v65)
        objc_enumerationMutation(obj);
      v6 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * v5);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = v6;
        objc_msgSend(v7, "type");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "type");

        v10 = v9 - 13;
        if ((unint64_t)(v9 - 13) > 2)
          goto LABEL_53;
        table = self->_table;
        objc_msgSend(v7, "name");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v80 = CFSTR("REScriptSymbolRuleTypeKey");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v10);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v81 = v13;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v81, &v80, 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(table) = -[REScriptSymbolTable define:type:options:error:](table, "define:type:options:error:", v12, 1, v14, a3);

        if (!(_DWORD)table)
          goto LABEL_53;
        v15 = self->_table;
        objc_msgSend(v7, "name");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "value");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v15) = -[REScriptSymbolTable setNodeValue:forDefinition:error:](v15, "setNodeValue:forDefinition:error:", v7, v17, a3);

        if ((v15 & 1) == 0)
          goto LABEL_54;
        goto LABEL_41;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v27 = v6;
          v28 = self->_table;
          objc_msgSend(v27, "name");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v78 = CFSTR("REScriptSymbolValueTypeKey");
          objc_msgSend(v27, "type");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "value");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v79 = v31;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v79, &v78, 1);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v28) = -[REScriptSymbolTable define:type:options:error:](v28, "define:type:options:error:", v29, 3, v32, a3);

          if (!(_DWORD)v28)
            goto LABEL_53;
          objc_msgSend(v27, "value");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (v20)
          {
            v33 = self->_table;
            objc_msgSend(v27, "name");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "value");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            LOBYTE(v33) = -[REScriptSymbolTable setNodeValue:forDefinition:error:](v33, "setNodeValue:forDefinition:error:", v20, v35, a3);

            if ((v33 & 1) == 0)
            {
LABEL_52:

LABEL_53:
LABEL_54:
              v60 = 0;
              goto LABEL_55;
            }
          }
          goto LABEL_26;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_41;
        v36 = v6;
        objc_msgSend(v36, "binaryExpressions");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v37, "expressions");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "firstObject");
          v39 = (id)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v39 = v37;
        }
        objc_msgSend(v36, "prefixExpression");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();

          if ((isKindOfClass & 1) != 0)
          {
            objc_msgSend(v36, "prefixExpression");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "token");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "value");
            v44 = (void *)objc_claimAutoreleasedReturnValue();

            v67 = 0;
            if (-[REScriptSymbolTable typeForDefinition:type:](self->_table, "typeForDefinition:type:", v44, &v67))
            {
              objc_msgSend(v39, "binaryOperator");
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              v46 = objc_msgSend(v45, "type");

              if (v67 == 3)
              {
                if (v46 - 29 < 2)
                  goto LABEL_34;
              }
              else if (!v67 && v46 == 30)
              {
LABEL_34:
                v47 = self->_table;
                objc_msgSend(v36, "binaryExpressions");
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                LODWORD(v47) = -[REScriptSymbolTable setNodeValue:forDefinition:error:](v47, "setNodeValue:forDefinition:error:", v48, v44, a3);

                v49 = v47 ^ 1;
                goto LABEL_38;
              }
              if (a3)
              {
                v54 = (void *)MEMORY[0x24BDD17C8];
                REDescriptionForTokenType(v46);
                v55 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v54, "stringWithFormat:", CFSTR("Invalid operator %@. Expecting assignment operator. Did you mean to use \"<-\"?"), v55);
                v56 = (void *)objc_claimAutoreleasedReturnValue();

                v74 = CFSTR("REErrorTokenKey");
                objc_msgSend(v39, "expression");
                v63 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v63, "token");
                v57 = (void *)objc_claimAutoreleasedReturnValue();
                v75 = v57;
                objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v75, &v74, 1);
                v58 = (void *)objc_claimAutoreleasedReturnValue();
                RECreateErrorWithCodeMessageAndUseInfo(204, v56, v58);
                *a3 = (id)objc_claimAutoreleasedReturnValue();

                v49 = 1;
                goto LABEL_38;
              }
            }
            else if (a3)
            {
              v76 = CFSTR("REErrorTokenKey");
              objc_msgSend(v36, "prefixExpression");
              v62 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v62, "token");
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              v77 = v52;
              v49 = 1;
              objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v77, &v76, 1);
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              RECreateErrorWithCodeAndUseInfo(207, v53);
              *a3 = (id)objc_claimAutoreleasedReturnValue();

              goto LABEL_38;
            }
            v49 = 1;
LABEL_38:

LABEL_40:
            if (v49)
              goto LABEL_54;
            goto LABEL_41;
          }
        }
        else
        {

        }
        if (a3)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unexpected top level expression."));
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v72 = CFSTR("REErrorTokenKey");
          objc_msgSend(v36, "binaryExpressions");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          v73 = v50;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v73, &v72, 1);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          RECreateErrorWithCodeMessageAndUseInfo(209, v44, v51);
          *a3 = (id)objc_claimAutoreleasedReturnValue();

          v49 = 1;
          goto LABEL_38;
        }
        v49 = 1;
        goto LABEL_40;
      }
      v18 = v6;
      objc_msgSend(v18, "options");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      REValidatedFeatureOptionsDictionary(v19, a3);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v20)
        goto LABEL_52;
      v21 = self->_table;
      objc_msgSend(v18, "name");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v21) = -[REScriptSymbolTable define:type:options:error:](v21, "define:type:options:error:", v22, 0, v20, a3);

      if (!(_DWORD)v21)
        goto LABEL_52;
      objc_msgSend(v18, "value");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v23)
      {

LABEL_26:
        goto LABEL_41;
      }
      v24 = self->_table;
      objc_msgSend(v18, "name");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "value");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v24) = -[REScriptSymbolTable setNodeValue:forDefinition:error:](v24, "setNodeValue:forDefinition:error:", v23, v26, a3);

      if ((v24 & 1) == 0)
        goto LABEL_54;
LABEL_41:
      ++v5;
    }
    while (v66 != v5);
    v59 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v68, v82, 16);
    v60 = 1;
    v66 = v59;
  }
  while (v59);
LABEL_55:

  return v60;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_table, 0);
  objc_storeStrong((id *)&self->_nodes, 0);
}

@end
