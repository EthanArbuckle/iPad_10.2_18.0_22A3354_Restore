@implementation TIHandwritingCandidate

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TIHandwritingCandidate;
  result = -[TIKeyboardCandidateSingle copyWithZone:](&v5, sel_copyWithZone_, a3);
  if (result)
  {
    *((_QWORD *)result + 28) = self->_uniqueID;
    *((_QWORD *)result + 29) = self->_completionUniqueID;
  }
  return result;
}

- (TIHandwritingCandidate)initWithCoder:(id)a3
{
  id v4;
  TIHandwritingCandidate *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)TIHandwritingCandidate;
  v5 = -[TIKeyboardCandidateSingle initWithCoder:](&v7, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_uniqueID = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("uniqueID"));
    v5->_completionUniqueID = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("completionUniqueID"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  unint64_t uniqueID;
  unint64_t completionUniqueID;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)TIHandwritingCandidate;
  -[TIKeyboardCandidateSingle encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  uniqueID = self->_uniqueID;
  if (uniqueID)
    objc_msgSend(v4, "encodeInt64:forKey:", uniqueID, CFSTR("uniqueID"));
  completionUniqueID = self->_completionUniqueID;
  if (completionUniqueID)
    objc_msgSend(v4, "encodeInt64:forKey:", completionUniqueID, CFSTR("completionUniqueID"));

}

- (TIHandwritingCandidate)initWithCandidate:(id)a3 forInput:(id)a4 uniqueID:(unint64_t)a5 completionUniqueID:(unint64_t)a6
{
  TIHandwritingCandidate *v8;
  TIHandwritingCandidate *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)TIHandwritingCandidate;
  v8 = -[TIKeyboardCandidateSingle initWithCandidate:forInput:](&v11, sel_initWithCandidate_forInput_, a3, a4);
  v9 = v8;
  if (v8)
  {
    v8->_uniqueID = a5;
    v8->_completionUniqueID = a6;
    -[TIKeyboardCandidate setTypingEngine:](v8, "setTypingEngine:", 6);
  }
  return v9;
}

- (BOOL)isInlineCompletionCandidate
{
  unint64_t v3;

  v3 = -[TIHandwritingCandidate uniqueID](self, "uniqueID");
  if (v3)
    LOBYTE(v3) = -[TIHandwritingCandidate completionUniqueID](self, "completionUniqueID") != 0;
  return v3;
}

- (TIHandwritingCandidate)initWithCandidateResultSetCoder:(id)a3
{
  id v4;
  TIHandwritingCandidate *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)TIHandwritingCandidate;
  v5 = -[TIKeyboardCandidateSingle initWithCandidateResultSetCoder:](&v7, sel_initWithCandidateResultSetCoder_, v4);
  if (v5)
  {
    v5->_uniqueID = objc_msgSend(v4, "decodeUInt64");
    v5->_completionUniqueID = objc_msgSend(v4, "decodeUInt64");
  }

  return v5;
}

- (void)encodeWithCandidateResultSetCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TIHandwritingCandidate;
  v4 = a3;
  -[TIKeyboardCandidateSingle encodeWithCandidateResultSetCoder:](&v5, sel_encodeWithCandidateResultSetCoder_, v4);
  objc_msgSend(v4, "encodeUInt64:", self->_uniqueID, v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeUInt64:", self->_completionUniqueID);

}

- (unint64_t)uniqueID
{
  return self->_uniqueID;
}

- (unint64_t)completionUniqueID
{
  return self->_completionUniqueID;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (int)type
{
  return 4;
}

@end
