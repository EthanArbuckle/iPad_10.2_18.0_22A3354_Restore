@implementation _SVXAddViewsExpressionParser

- (_SVXAddViewsExpressionParser)initWithParsingService:(id)a3 preferences:(id)a4
{
  _SVXAddViewsExpressionParser *v4;
  _SVXAddViewsExpressionParser *v5;
  SVXAFSpeakableUtteranceParserProvider *v6;
  SVXAFSpeakableUtteranceParserProvider *speakableUtteranceParserProvider;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_SVXAddViewsExpressionParser;
  v4 = -[_SVXExpressionParser initWithParsingService:preferences:](&v9, sel_initWithParsingService_preferences_, a3, a4);
  v5 = v4;
  if (v4)
  {
    v4->_ignoresLocallyParseableExpressions = 1;
    v6 = objc_alloc_init(SVXAFSpeakableUtteranceParserProvider);
    speakableUtteranceParserProvider = v5->_speakableUtteranceParserProvider;
    v5->_speakableUtteranceParserProvider = v6;

  }
  return v5;
}

- (void)parseAddViews:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  os_log_t *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v8 = (os_log_t *)MEMORY[0x24BE08FB0];
    v9 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v22 = "-[_SVXAddViewsExpressionParser parseAddViews:reply:]";
      v23 = 2112;
      v24 = v6;
      _os_log_impl(&dword_214934000, v9, OS_LOG_TYPE_INFO, "%s Looking for parseable expressions in command %@", buf, 0x16u);
    }
    -[_SVXAddViewsExpressionParser _prepareParsingModelWithAddViews:](self, "_prepareParsingModelWithAddViews:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "parseableExpressions");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count");

    if (v12)
    {
      -[_SVXExpressionParser parsingService](self, "parsingService");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "parseableExpressions");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = MEMORY[0x24BDAC760];
      v17[1] = 3221225472;
      v17[2] = __52___SVXAddViewsExpressionParser_parseAddViews_reply___block_invoke;
      v17[3] = &unk_24D24CCE8;
      v17[4] = self;
      v18 = v6;
      v19 = v10;
      v20 = v7;
      objc_msgSend(v13, "parseExpressions:targetDevice:reply:", v14, 0, v17);

    }
    else
    {
      v15 = *v8;
      if (os_log_type_enabled(*v8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v22 = "-[_SVXAddViewsExpressionParser parseAddViews:reply:]";
        v23 = 2112;
        v24 = v6;
        _os_log_impl(&dword_214934000, v15, OS_LOG_TYPE_INFO, "%s Found no parseable expressions in command %@", buf, 0x16u);
      }
      v16 = (void *)objc_msgSend(v6, "copy");
      (*((void (**)(id, uint64_t, void *))v7 + 2))(v7, 1, v16);

    }
  }

}

- (id)_prepareParsingModelWithAddViews:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  SVXAFSpeakableUtteranceParserProvider *speakableUtteranceParserProvider;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  _SVXExpressionParsingModel *v31;
  id v33;
  uint64_t v34;
  void *v35;
  _SVXAddViewsExpressionParser *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint8_t buf[4];
  const char *v49;
  __int16 v50;
  void *v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v33 = a3;
  objc_msgSend(v33, "views");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
  v5 = 0;
  v6 = 0;
  v7 = 0;
  if (v42)
  {
    v41 = 0;
    v8 = *(_QWORD *)v45;
    v34 = *MEMORY[0x24BE09468];
    v35 = v4;
    v36 = self;
    v37 = *(_QWORD *)v45;
    while (1)
    {
      for (i = 0; i != v42; ++i)
      {
        if (*(_QWORD *)v45 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
        objc_msgSend(v10, "svx_parseableExpression");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        if (v11)
        {
          if (self->_ignoresLocallyParseableExpressions)
          {
            objc_msgSend(v11, "expressionString");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            if (!objc_msgSend(v13, "length"))
              goto LABEL_13;
            v38 = v13;
            v39 = v6;
            v40 = v7;
            v14 = v41;
            if (!v41)
            {
              speakableUtteranceParserProvider = v36->_speakableUtteranceParserProvider;
              v16 = objc_alloc(MEMORY[0x24BDBCEA0]);
              -[_SVXExpressionParser preferences](v36, "preferences");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "languageCode");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v19 = (void *)objc_msgSend(v16, "initWithLocaleIdentifier:", v18);
              -[SVXAFSpeakableUtteranceParserProvider getWithLocale:](speakableUtteranceParserProvider, "getWithLocale:", v19);
              v14 = (void *)objc_claimAutoreleasedReturnValue();

            }
            objc_msgSend(v10, "groupIdentifier");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            +[_SVXSpeakableNamespaceDomainOccurrenceProvider providerForDomain:](_SVXSpeakableNamespaceDomainOccurrenceProvider, "providerForDomain:", v20);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "registerProvider:forNamespace:", v21, v34);
            objc_msgSend(v12, "expressionString");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v43 = 0;
            v23 = (id)objc_msgSend(v14, "parseStringWithFormat:error:", v22, &v43);
            v24 = v43;

            v41 = v14;
            if (v24)
            {
              objc_msgSend(v14, "registerProvider:forNamespace:", 0, v34);

              v4 = v35;
              self = v36;
              v7 = v40;
              v13 = v38;
              v6 = v39;
LABEL_13:

              v8 = v37;
LABEL_14:
              v25 = *MEMORY[0x24BE08FB0];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 136315394;
                v49 = "-[_SVXAddViewsExpressionParser _prepareParsingModelWithAddViews:]";
                v50 = 2112;
                v51 = v12;
                _os_log_impl(&dword_214934000, v25, OS_LOG_TYPE_INFO, "%s Expression doesn't require remote parse: %@", buf, 0x16u);
              }
              goto LABEL_20;
            }
            v26 = objc_msgSend(v21, "count");
            objc_msgSend(v14, "registerProvider:forNamespace:", 0, v34);

            v4 = v35;
            self = v36;
            v7 = v40;
            v6 = v39;
            v8 = v37;
            if (!v26)
              goto LABEL_14;
          }
          if (!v7)
          {
            v7 = (void *)objc_opt_new();
            v27 = objc_opt_new();

            v28 = objc_opt_new();
            v5 = (void *)v28;
            v6 = (void *)v27;
          }
          objc_msgSend(v10, "aceId");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setObject:forKey:", v10, v29);
          objc_msgSend(v12, "aceId");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setObject:forKey:", v29, v30);

          objc_msgSend(v7, "addObject:", v12);
        }
LABEL_20:

      }
      v42 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
      if (!v42)
        goto LABEL_24;
    }
  }
  v41 = 0;
LABEL_24:

  v31 = -[_SVXExpressionParsingModel initWithParseableExpressions:aceViewIdByExpressionId:aceViewByAceId:]([_SVXExpressionParsingModel alloc], "initWithParseableExpressions:aceViewIdByExpressionId:aceViewByAceId:", v7, v6, v5);
  return v31;
}

- (id)_parseViews:(id)a3 addViews:(id)a4 aceViewByAceId:(id)a5 aceIdByParseableExpressionIds:(id)a6
{
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  os_log_t *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  os_log_t v22;
  NSObject *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  id v27;
  unint64_t v28;
  NSObject *v29;
  void *v30;
  void *v32;
  void *v33;
  id obj;
  uint64_t v35;
  id v36;
  id v37;
  uint64_t v38;
  _QWORD v39[4];
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t buf[4];
  const char *v46;
  __int16 v47;
  id v48;
  __int16 v49;
  id v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  void *v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v37 = a5;
  v36 = a6;
  v11 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v46 = "-[_SVXAddViewsExpressionParser _parseViews:addViews:aceViewByAceId:aceIdByParseableExpressionIds:]";
    v47 = 2112;
    v48 = v10;
    v49 = 2112;
    v50 = v9;
    _os_log_impl(&dword_214934000, v11, OS_LOG_TYPE_INFO, "%s Successfully parsed expressions for command: %@\n    Parsed expressions: %@", buf, 0x20u);
  }
  v33 = v10;
  v32 = (void *)objc_msgSend(v10, "copy");
  objc_msgSend(v32, "views");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "mutableCopy");
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  obj = v9;
  v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v55, 16);
  if (v38)
  {
    v35 = *(_QWORD *)v42;
    do
    {
      v14 = 0;
      v15 = (os_log_t *)MEMORY[0x24BE08FB0];
      do
      {
        if (*(_QWORD *)v42 != v35)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v14);
        objc_msgSend(v16, "parseableExpression");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "aceId");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "objectForKey:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "objectForKey:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        v21 = (void *)objc_msgSend(v20, "copy");
        v22 = *v15;
        if (os_log_type_enabled(*v15, OS_LOG_TYPE_INFO))
        {
          v23 = v22;
          objc_msgSend(v16, "description");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "description");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136316162;
          v46 = "-[_SVXAddViewsExpressionParser _parseViews:addViews:aceViewByAceId:aceIdByParseableExpressionIds:]";
          v47 = 2112;
          v48 = v16;
          v49 = 2112;
          v50 = v21;
          v51 = 2112;
          v52 = v24;
          v53 = 2112;
          v54 = v25;
          _os_log_impl(&dword_214934000, v23, OS_LOG_TYPE_INFO, "%s Applying parsed expression %@ to view %@\n    Parsed expression: %@\n    View: %@", buf, 0x34u);

          v15 = (os_log_t *)MEMORY[0x24BE08FB0];
        }
        objc_msgSend(v21, "svx_applyParsedExpression:", v16);
        v26 = *v15;
        if (os_log_type_enabled(*v15, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315650;
          v46 = "-[_SVXAddViewsExpressionParser _parseViews:addViews:aceViewByAceId:aceIdByParseableExpressionIds:]";
          v47 = 2112;
          v48 = v12;
          v49 = 2112;
          v50 = v13;
          _os_log_impl(&dword_214934000, v26, OS_LOG_TYPE_INFO, "%s Splicing in applied parsed expression\n    Original views: %@\n    Updated views: %@", buf, 0x20u);
        }
        v39[0] = MEMORY[0x24BDAC760];
        v39[1] = 3221225472;
        v39[2] = __98___SVXAddViewsExpressionParser__parseViews_addViews_aceViewByAceId_aceIdByParseableExpressionIds___block_invoke;
        v39[3] = &unk_24D24CD10;
        v27 = v20;
        v40 = v27;
        v28 = objc_msgSend(v12, "indexOfObjectPassingTest:", v39);
        if (v28 >= objc_msgSend(v13, "count"))
        {
          v29 = *v15;
          if (os_log_type_enabled(*v15, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315906;
            v46 = "-[_SVXAddViewsExpressionParser _parseViews:addViews:aceViewByAceId:aceIdByParseableExpressionIds:]";
            v47 = 2112;
            v48 = v21;
            v49 = 2112;
            v50 = v27;
            v51 = 2112;
            v52 = v13;
            _os_log_error_impl(&dword_214934000, v29, OS_LOG_TYPE_ERROR, "%s Failed splicing updated view for view in array\n    Updated ace view: %@\n    Original ace view: %@\n    Updated views array: %@", buf, 0x2Au);
          }
        }
        else
        {
          objc_msgSend(v13, "replaceObjectAtIndex:withObject:", v28, v21);
        }

        ++v14;
      }
      while (v38 != v14);
      v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v55, 16);
    }
    while (v38);
  }

  v30 = (void *)objc_msgSend(v13, "copy");
  objc_msgSend(v32, "setViews:", v30);

  return v32;
}

- (BOOL)ignoresLocallyParseableExpressions
{
  return self->_ignoresLocallyParseableExpressions;
}

- (void)setIgnoresLocallyParseableExpressions:(BOOL)a3
{
  self->_ignoresLocallyParseableExpressions = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_speakableUtteranceParserProvider, 0);
}

@end
