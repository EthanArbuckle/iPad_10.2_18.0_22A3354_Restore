@implementation WBParticipantPresenceCoordinator

- (void)moveCurrentParticipantToTabIdentifier:(id)a3 inTabGroupIdentifier:(id)a4 withDeviceIdentifier:(id)a5
{
  -[_WBParticipantPresenceCoordinator moveCurrentParticipantToTabIdentifier:inTabGroupIdentifier:withDeviceIdentifier:](self->_internalCoordinator, "moveCurrentParticipantToTabIdentifier:inTabGroupIdentifier:withDeviceIdentifier:", a3, a4, a5);
}

uint64_t __95__WBParticipantPresenceCoordinator_getActiveParticipantsInTabWithIdentifier_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)getActiveParticipantsInTabWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  _WBParticipantPresenceCoordinator *internalCoordinator;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  internalCoordinator = self->_internalCoordinator;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __95__WBParticipantPresenceCoordinator_getActiveParticipantsInTabWithIdentifier_completionHandler___block_invoke;
  v9[3] = &unk_251BC8CD0;
  v10 = v6;
  v8 = v6;
  -[_WBParticipantPresenceCoordinator getActiveParticipantsInTabWithIdentifier:completionHandler:](internalCoordinator, "getActiveParticipantsInTabWithIdentifier:completionHandler:", a3, v9);

}

- (WBParticipantPresenceCoordinator)init
{
  WBParticipantPresenceCoordinator *v2;
  _WBParticipantPresenceCoordinator *v3;
  _WBParticipantPresenceCoordinator *internalCoordinator;
  WBParticipantPresenceCoordinator *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WBParticipantPresenceCoordinator;
  v2 = -[WBParticipantPresenceCoordinator init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(_WBParticipantPresenceCoordinator);
    internalCoordinator = v2->_internalCoordinator;
    v2->_internalCoordinator = v3;

    -[_WBParticipantPresenceCoordinator setDelegate:](v2->_internalCoordinator, "setDelegate:", v2);
    v5 = v2;
  }

  return v2;
}

void __95__WBParticipantPresenceCoordinator_getActiveParticipantsInTabWithIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __95__WBParticipantPresenceCoordinator_getActiveParticipantsInTabWithIdentifier_completionHandler___block_invoke_2;
  v6[3] = &unk_251BC8C30;
  v4 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

- (void)beginDeviceCoordination
{
  -[_WBParticipantPresenceCoordinator beginDeviceCoordination](self->_internalCoordinator, "beginDeviceCoordination");
}

- (void)endDeviceCoordination
{
  -[_WBParticipantPresenceCoordinator endDeviceCoordination](self->_internalCoordinator, "endDeviceCoordination");
}

- (void)beginCollaborationForShare:(id)a3
{
  -[_WBParticipantPresenceCoordinator beginCollaborationForShare:](self->_internalCoordinator, "beginCollaborationForShare:", a3);
}

- (void)shareDidUpdate:(id)a3
{
  -[_WBParticipantPresenceCoordinator shareDidUpdate:](self->_internalCoordinator, "shareDidUpdate:", a3);
}

- (void)endCollaborationForShare:(id)a3
{
  -[_WBParticipantPresenceCoordinator endCollaborationForShare:](self->_internalCoordinator, "endCollaborationForShare:", a3);
}

- (void)getTabGroupIdentifierForParticipantIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  _WBParticipantPresenceCoordinator *internalCoordinator;
  _QWORD v9[4];
  id v10;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "length"))
  {
    internalCoordinator = self->_internalCoordinator;
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __100__WBParticipantPresenceCoordinator_getTabGroupIdentifierForParticipantIdentifier_completionHandler___block_invoke;
    v9[3] = &unk_251BC8C58;
    v10 = v7;
    -[_WBParticipantPresenceCoordinator getTabGroupIdentifierForParticipantIdentifier:completionHandler:](internalCoordinator, "getTabGroupIdentifierForParticipantIdentifier:completionHandler:", v6, v9);

  }
  else
  {
    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  }

}

void __100__WBParticipantPresenceCoordinator_getTabGroupIdentifierForParticipantIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __100__WBParticipantPresenceCoordinator_getTabGroupIdentifierForParticipantIdentifier_completionHandler___block_invoke_2;
  v6[3] = &unk_251BC8C30;
  v4 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

uint64_t __100__WBParticipantPresenceCoordinator_getTabGroupIdentifierForParticipantIdentifier_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)getTabIdentifierForParticipantIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  _WBParticipantPresenceCoordinator *internalCoordinator;
  _QWORD v9[4];
  id v10;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "length"))
  {
    internalCoordinator = self->_internalCoordinator;
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __95__WBParticipantPresenceCoordinator_getTabIdentifierForParticipantIdentifier_completionHandler___block_invoke;
    v9[3] = &unk_251BC8C58;
    v10 = v7;
    -[_WBParticipantPresenceCoordinator getTabIdentifierForParticipantIdentifier:completionHandler:](internalCoordinator, "getTabIdentifierForParticipantIdentifier:completionHandler:", v6, v9);

  }
  else
  {
    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  }

}

void __95__WBParticipantPresenceCoordinator_getTabIdentifierForParticipantIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __95__WBParticipantPresenceCoordinator_getTabIdentifierForParticipantIdentifier_completionHandler___block_invoke_2;
  v6[3] = &unk_251BC8C30;
  v4 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

uint64_t __95__WBParticipantPresenceCoordinator_getTabIdentifierForParticipantIdentifier_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)getCurrentLocationIdentifiersForParticipantIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  _WBParticipantPresenceCoordinator *internalCoordinator;
  _QWORD v9[4];
  id v10;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "length"))
  {
    internalCoordinator = self->_internalCoordinator;
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __108__WBParticipantPresenceCoordinator_getCurrentLocationIdentifiersForParticipantIdentifier_completionHandler___block_invoke;
    v9[3] = &unk_251BC8CA8;
    v10 = v7;
    -[_WBParticipantPresenceCoordinator getCurrentLocationIdentifiersForParticipantIdentifier:completionHandler:](internalCoordinator, "getCurrentLocationIdentifiersForParticipantIdentifier:completionHandler:", v6, v9);

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
  }

}

void __108__WBParticipantPresenceCoordinator_getCurrentLocationIdentifiersForParticipantIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __108__WBParticipantPresenceCoordinator_getCurrentLocationIdentifiersForParticipantIdentifier_completionHandler___block_invoke_2;
  block[3] = &unk_251BC8C80;
  v7 = *(id *)(a1 + 32);
  v12 = v6;
  v13 = v7;
  v11 = v5;
  v8 = v6;
  v9 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __108__WBParticipantPresenceCoordinator_getCurrentLocationIdentifiersForParticipantIdentifier_completionHandler___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)getActiveParticipantsInTabGroupWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  _WBParticipantPresenceCoordinator *internalCoordinator;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  internalCoordinator = self->_internalCoordinator;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __100__WBParticipantPresenceCoordinator_getActiveParticipantsInTabGroupWithIdentifier_completionHandler___block_invoke;
  v9[3] = &unk_251BC8CD0;
  v10 = v6;
  v8 = v6;
  -[_WBParticipantPresenceCoordinator getActiveParticipantsInTabGroupWithIdentifier:completionHandler:](internalCoordinator, "getActiveParticipantsInTabGroupWithIdentifier:completionHandler:", a3, v9);

}

void __100__WBParticipantPresenceCoordinator_getActiveParticipantsInTabGroupWithIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __100__WBParticipantPresenceCoordinator_getActiveParticipantsInTabGroupWithIdentifier_completionHandler___block_invoke_2;
  v6[3] = &unk_251BC8C30;
  v4 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

uint64_t __100__WBParticipantPresenceCoordinator_getActiveParticipantsInTabGroupWithIdentifier_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)getCurrentConnectionStateWithCompletionHandler:(id)a3
{
  id v4;
  _WBParticipantPresenceCoordinator *internalCoordinator;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  internalCoordinator = self->_internalCoordinator;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __83__WBParticipantPresenceCoordinator_getCurrentConnectionStateWithCompletionHandler___block_invoke;
  v7[3] = &unk_251BC8CF8;
  v8 = v4;
  v6 = v4;
  -[_WBParticipantPresenceCoordinator getCurrentConnectionStateWithCompletionHandler:](internalCoordinator, "getCurrentConnectionStateWithCompletionHandler:", v7);

}

void __83__WBParticipantPresenceCoordinator_getCurrentConnectionStateWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __83__WBParticipantPresenceCoordinator_getCurrentConnectionStateWithCompletionHandler___block_invoke_2;
  v6[3] = &unk_251BC8C30;
  v4 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

uint64_t __83__WBParticipantPresenceCoordinator_getCurrentConnectionStateWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)participantPresenceCoordinator:(id)a3 didUpdateActiveParticipants:(id)a4 inTabGroupWithIdentifier:(id)a5
{
  id v7;
  id WeakRetained;
  id v9;

  v9 = a4;
  v7 = a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "participantPresenceCoordinator:didUpdateActiveParticipants:inTabGroupWithIdentifier:", self, v9, v7);

}

- (void)participantPresenceCoordinator:(id)a3 didUpdateActiveParticipants:(id)a4 inTabWithIdentifier:(id)a5
{
  id v7;
  id WeakRetained;
  id v9;

  v9 = a4;
  v7 = a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "participantPresenceCoordinator:didUpdateActiveParticipants:inTabWithIdentifier:", self, v9, v7);

}

- (WBParticipantPresenceCoordinatorDelegate)delegate
{
  return (WBParticipantPresenceCoordinatorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_internalCoordinator, 0);
}

@end
