@implementation SearchTopHitsSuggestion

- (id)category
{
  return +[MUISearchSuggestionCategory topHitsCategory](MUISearchSuggestionCategory, "topHitsCategory");
}

- (void)userDidInteract
{
  id v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[SearchTopHitsSuggestion queryResult](self, "queryResult"));
  v3 = -[SearchTopHitsSuggestion messageConversationID]_0(self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  objc_msgSend(v5, "userDidInteractWithConversationID:", v4);

}

- (id)messageConversationID
{
  void *v1;
  void *v2;
  void *v3;

  if (a1)
  {
    v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "message"));
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", objc_msgSend(v1, "conversationID")));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "stringValue"));

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (int64_t)rankingIndex
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SearchTopHitsSuggestion queryResult](self, "queryResult"));
  v4 = -[SearchTopHitsSuggestion messageConversationID]_0(self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = objc_msgSend(v3, "rankingIndexForConversationID:", v5);

  return (int64_t)v6;
}

- (EMMessage)message
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SearchTopHitsSuggestion messageList](self, "messageList"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SearchTopHitsSuggestion itemID](self, "itemID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "messageListItemForItemID:", v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "result"));

  return (EMMessage *)v6;
}

- (EMMessageList)messageList
{
  return self->_messageList;
}

- (EMCollectionItemID)itemID
{
  return self->_itemID;
}

- (EMSearchableIndexTopHitsQueryResult)queryResult
{
  return self->_queryResult;
}

- (NSDictionary)matchingHintsByGlobalMessageID
{
  return self->_matchingHintsByGlobalMessageID;
}

- (void)setMatchingHintsByGlobalMessageID:(id)a3
{
  objc_storeStrong((id *)&self->_matchingHintsByGlobalMessageID, a3);
}

- (SFMailRankingSignals)mailRankingSignals
{
  return self->_mailRankingSignals;
}

- (void)setMailRankingSignals:(id)a3
{
  objc_storeStrong((id *)&self->_mailRankingSignals, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mailRankingSignals, 0);
  objc_storeStrong((id *)&self->_matchingHintsByGlobalMessageID, 0);
  objc_storeStrong((id *)&self->_queryResult, 0);
  objc_storeStrong((id *)&self->_itemID, 0);
  objc_storeStrong((id *)&self->_messageList, 0);
}

@end
