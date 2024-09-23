@implementation SFFeedbackNotify

void __SFFeedbackNotify_block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  getWeakListeners();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v15;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v15 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v6), "strongListener");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v7;
        if (v7)
        {
          v10 = *(void **)(a1 + 32);
          v9 = *(_QWORD *)(a1 + 40);
          v11 = v7;
          v12 = v10;
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            objc_msgSend(v11, "reportFeedback:queryId:", v12, v9);
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
            {
              objc_msgSend(v11, "searchViewDidAppear:", v12);
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
              {
                objc_msgSend(v11, "searchViewDidDisappear:", v12);
              }
              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
                {
                  objc_msgSend(v11, "cardViewDidAppear:", v12);
                }
                else
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
                  {
                    objc_msgSend(v11, "cardViewDidDisappear:", v12);
                  }
                  else
                  {
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
                    {
                      objc_msgSend(v11, "didStartSearch:", v12);
                    }
                    else
                    {
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
                      {
                        objc_msgSend(v11, "didEndSearch:", v12);
                      }
                      else
                      {
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
                        {
                          objc_msgSend(v11, "didRankSections:", v12);
                        }
                        else
                        {
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
                          {
                            objc_msgSend(v11, "didEngageResult:", v12);
                          }
                          else
                          {
                            objc_opt_class();
                            if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
                            {
                              objc_msgSend(v11, "didGradeResultRelevancy:", v12);
                            }
                            else
                            {
                              objc_opt_class();
                              if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
                              {
                                objc_msgSend(v11, "didEngageSuggestion:", v12);
                              }
                              else
                              {
                                objc_opt_class();
                                if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
                                {
                                  objc_msgSend(v11, "didEngageCardSection:", v12);
                                }
                                else
                                {
                                  objc_opt_class();
                                  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
                                  {
                                    objc_msgSend(v11, "didErrorOccur:", v12);
                                  }
                                  else
                                  {
                                    objc_opt_class();
                                    if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
                                    {
                                      objc_msgSend(v11, "sendCustomFeedback:", v12);
                                    }
                                    else
                                    {
                                      objc_opt_class();
                                      if ((objc_opt_isKindOfClass() & 1) != 0
                                        && (objc_opt_respondsToSelector() & 1) != 0)
                                      {
                                        objc_msgSend(v11, "resultsDidBecomeVisible:", v12);
                                      }
                                      else
                                      {
                                        objc_opt_class();
                                        if ((objc_opt_isKindOfClass() & 1) != 0
                                          && (objc_opt_respondsToSelector() & 1) != 0)
                                        {
                                          objc_msgSend(v11, "suggestionsDidBecomeVisible:", v12);
                                        }
                                        else
                                        {
                                          objc_opt_class();
                                          if ((objc_opt_isKindOfClass() & 1) != 0
                                            && (objc_opt_respondsToSelector() & 1) != 0)
                                          {
                                            objc_msgSend(v11, "didReceiveResultsAfterTimeout:", v12);
                                          }
                                          else
                                          {
                                            objc_opt_class();
                                            if ((objc_opt_isKindOfClass() & 1) != 0
                                              && (objc_opt_respondsToSelector() & 1) != 0)
                                            {
                                              objc_msgSend(v11, "didAppendLateSections:", v12);
                                            }
                                            else
                                            {
                                              objc_opt_class();
                                              if ((objc_opt_isKindOfClass() & 1) != 0
                                                && (objc_opt_respondsToSelector() & 1) != 0)
                                              {
                                                objc_msgSend(v11, "didClearInput:", v12);
                                              }
                                              else
                                              {
                                                objc_opt_class();
                                                if ((objc_opt_isKindOfClass() & 1) != 0
                                                  && (objc_opt_respondsToSelector() & 1) != 0)
                                                {
                                                  objc_msgSend(v11, "didEngageSection:", v12);
                                                }
                                                else
                                                {
                                                  objc_opt_class();
                                                  if ((objc_opt_isKindOfClass() & 1) != 0
                                                    && (objc_opt_respondsToSelector() & 1) != 0)
                                                  {
                                                    objc_msgSend(v11, "sectionHeaderDidBecomeVisible:", v12);
                                                  }
                                                  else
                                                  {
                                                    objc_opt_class();
                                                    if ((objc_opt_isKindOfClass() & 1) != 0
                                                      && (objc_opt_respondsToSelector() & 1) != 0)
                                                    {
                                                      objc_msgSend(v11, "didGoToSite:", v12);
                                                    }
                                                    else
                                                    {
                                                      objc_opt_class();
                                                      if ((objc_opt_isKindOfClass() & 1) != 0
                                                        && (objc_opt_respondsToSelector() & 1) != 0)
                                                      {
                                                        objc_msgSend(v11, "didGoToSearch:", v12);
                                                      }
                                                      else
                                                      {
                                                        objc_opt_class();
                                                        if ((objc_opt_isKindOfClass() & 1) != 0
                                                          && (objc_opt_respondsToSelector() & 1) != 0)
                                                        {
                                                          objc_msgSend(v11, "didGradeLookupHintRelevancy:", v12);
                                                        }
                                                        else
                                                        {
                                                          objc_opt_class();
                                                          if ((objc_opt_isKindOfClass() & 1) != 0)
                                                          {
                                                            if ((objc_opt_respondsToSelector() & 1) != 0)
                                                            {
                                                              objc_msgSend(v11, "didSubmitUserReportFeedback:", v12);
                                                            }
                                                            else if ((objc_opt_respondsToSelector() & 1) != 0)
                                                            {
                                                              objc_msgSend(v11, "didReportUserResponseFeedback:", v12);
                                                            }
                                                          }
                                                        }
                                                      }
                                                    }
                                                  }
                                                }
                                              }
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }

        }
        ++v6;
      }
      while (v4 != v6);
      v13 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      v4 = v13;
    }
    while (v13);
  }

}

@end
