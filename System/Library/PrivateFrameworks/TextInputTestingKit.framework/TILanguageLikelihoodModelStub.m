@implementation TILanguageLikelihoodModelStub

- (id)rankedLanguagesForRecipient:(id)a3
{
  return (id)MEMORY[0x24BDBD1A8];
}

- (void)priorProbabilityForLanguages:(id)a3 recipient:(id)a4 handler:(id)a5
{
  id v6;
  void (**v7)(id, _QWORD, char *, float);
  unint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  float v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  char v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, _QWORD, char *, float))a5;
  v19 = 0;
  v8 = objc_msgSend(v6, "count");
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v16;
    v13 = 1.0 / (float)v8;
LABEL_3:
    v14 = 0;
    while (1)
    {
      if (*(_QWORD *)v16 != v12)
        objc_enumerationMutation(v9);
      v7[2](v7, *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v14), &v19, v13);
      if (v19)
        break;
      if (v11 == ++v14)
      {
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
        if (v11)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (unint64_t)emojiUsageCountForApp:(id)a3 lastEmojiCountUpdateTime:(double *)a4
{
  uint64_t v6;

  if (a4)
  {
    -[TILanguageLikelihoodModelStub emojiLastUsageTime](self, "emojiLastUsageTime", a3);
    *(_QWORD *)a4 = v6;
  }
  return -[TILanguageLikelihoodModelStub emojiUsageCount](self, "emojiUsageCount", a3);
}

- (unint64_t)emojiUsageCount
{
  return self->_emojiUsageCount;
}

- (void)setEmojiUsageCount:(unint64_t)a3
{
  self->_emojiUsageCount = a3;
}

- (double)emojiLastUsageTime
{
  return self->_emojiLastUsageTime;
}

- (void)setEmojiLastUsageTime:(double)a3
{
  self->_emojiLastUsageTime = a3;
}

@end
