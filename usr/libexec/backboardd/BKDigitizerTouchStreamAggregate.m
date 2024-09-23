@implementation BKDigitizerTouchStreamAggregate

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return (unint64_t)-[NSMutableArray countByEnumeratingWithState:objects:count:](self->_clients, "countByEnumeratingWithState:objects:count:", a3, a4, a5);
}

- (NSString)description
{
  return (NSString *)+[BSDescriptionStream descriptionForRootObject:](BSDescriptionStream, "descriptionForRootObject:", self);
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v5;
  _QWORD v6[6];

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100086F88;
  v6[3] = &unk_1000ECD80;
  v6[4] = a3;
  v6[5] = self;
  objc_msgSend(a3, "appendProem:block:", self, v6);
  v5 = objc_msgSend(a3, "appendObject:withName:", self->_clients, CFSTR("clients"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clients, 0);
  objc_storeStrong((id *)&self->_displayUUID, 0);
}

@end
