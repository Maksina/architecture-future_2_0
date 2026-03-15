# Каталог доменных событий 

## 1. События домена «Финансы»

| Событие | Контекст-источник | Семантика | Контракт |
|---|---|---|---|
|CreditContractCreated| Кредиты и счета | Создан новый кредитный договор. | `contractId`, `clientId`, `amount`, `currency`, `status`, `createdAt` |
|CreditContractActivated| Кредиты и счета | Договор активирован, средства доступны. | `contractId`, `activatedAt`|
|CreditContractClosed| Кредиты и счета | Договор закрыт (погашен или расторгнут). | `contractId`, `closedAt`, `reason` |
|AccountOpened| Кредиты и счета | Открыт новый счёт. | `accountId`, `clientId`, `accountType`, `currency`, `openedAt` |
|AccountDebited/AccountCredited| Кредиты и счета | Списание или зачисление по счёту. | `accountId`, `amount`, `currency`, `operationId`, `at` |
|AccountClosed| Кредиты и счета | Счёт закрыт. | `accountId`, `closedAt` |

## 2. События домена «Клиники»

| Событие | Контекст-источник | Семантика | Контракт |
|---|---|---|---|
|AppointmentScheduled| Поток пациентов и ресурсы | Запланирован приём. | `appointmentId`, `resourceId`, `patientId`, `scheduledAt`, `clinicId` |
|AppointmentCompleted| Поток пациентов и ресурсы | Приём завершён. | `appointmentId`, `completedAt`, `resourceId` |
|AppointmentCancelled| Поток пациентов и ресурсы | Приём отменён. | `appointmentId`, `cancelledAt`, `reason` |
|AppointmentRescheduled| Поток пациентов и ресурсы | Приём перенесён на другое время. | `appointmentId`, `previousAt`, `newScheduledAt`, `resourceId` |
|ResourceRegistered| Поток пациентов и ресурсы | Врач зарегистрирован в системе. | `resourceId`, `clinicId`, `resourceType`, `registeredAt` |
|ResourceAllocated/ResourceReleased | Поток пациентов и ресурсы | Ресурс выделен под приём или освобождён. | `resourceId`, `appointmentId`, `at` |

## 3. События домена «ИИ-сервисы»

| Событие | Контекст-источник | Семантика | Контракт |
|---|---|---|---|
|AIStudyRequested| Медицинская аналитика ИИ | Запрошено исследование с использованием ИИ. | `studyId`, `requestedAt`, `studyType` |
|AIStudyCompleted| Медицинская аналитика ИИ | Исследование ИИ успешно завершено; результат доступен в границах домена ИИ. | `studyId`, `completedAt`, `studyType`, `resultCode` |
|AIStudyFailed| Медицинская аналитика ИИ | Исследование завершилось с ошибкой. | `studyId`, `failedAt`, `errorCode` |

## 4. События домена «Фармацевтические компании и партнёры»

| Событие | Контекст-источник | Семантика | Контракт |
|---|---|---|---|
|PartnerOrderCreated| Поставки и партнёрские данные | Создан заказ у партнёра. | `orderId`, `partnerId`, `createdAt`|
|PartnerOrderConfirmed| Поставки и партнёрские данные | Партнёр подтвердил заказ. | `orderId`, `confirmedAt` |
|PartnerOrderShipped| Поставки и партнёрские данные | Заказ отгружен. | `orderId`, `shippedAt`, `trackingId` |
|PartnerOrderReceived| Поставки и партнёрские данные | Заказ получен. | `orderId`, `receivedAt` |

## 5. Подписчики событий

| Событие (пример) | Подписчики | Назначение |
|---|---|---|---|
| CreditContractCreated, AccountOpened | Аналитика (витрина) | Построение финансовых отчётов и дашбордов. |
| AppointmentScheduled, Completed, Cancelled | Аналитика (витрина), Финансы | Поток пациентов, загрузка ресурсов, выручка по приёмам. |
| AIStudyCompleted, Failed | Аналитика (витрина) | Объёмы и эффективность ИИ-исследований без доступа к персональным результатам. |
| PartnerOrder* | Аналитика (витрина), Клиники (инвентарь) | Отчётность по закупкам, обновление остатков. |
