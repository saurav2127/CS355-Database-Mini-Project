INSERT INTO Users (UID, username, password, role_id)
    VALUES
     (2, 'admin', '$2b$10$Ys9CxSNzb2QS8FRq..Of3eG2kowa4DNGRDX3fuufzZuEnIRfJblxu', 1),
     (3, 'aaf', 'aafaffaffafaff', 2),
     (6, 'gh1', '$2b$10$2MpPC40eJJQhxbZmjbJR.eqpPdsxgVn75L92.gfA.OG.BLB9VpLUq', 2),
     (7, 'admin2', '$2b$10$4SUFSO6shIPkH349yReyxut9euCL.2hCb/QcLLOIDSCU2ZeRivgsi', 1),
     (8, 'admin33', '$2b$10$itnEizweyE5rWvMjYfB/E.nxGYsj9sKmgAtC9eJYQw/aSMh.W3q0m', 4),
     (9, 'Jack', 'afafasfasf', 2),
     (11, 'Regular', '$2b$10$Ys9CxSNzb2QS8FRq..Of3eG2kowa4DNGRDX3fuufzZuEnIRfJblxu', 201),
     (12, 'CC1', '$2b$10$Ys9CxSNzb2QS8FRq..Of3eG2kowa4DNGRDX3fuufzZuEnIRfJblxu', 202),
     (14, 'Help1', '$2b$10$Ys9CxSNzb2QS8FRq..Of3eG2kowa4DNGRDX3fuufzZuEnIRfJblxu', 203),
     (15, 'Help2', '$2b$10$Ys9CxSNzb2QS8FRq..Of3eG2kowa4DNGRDX3fuufzZuEnIRfJblxu', 203),
     (16, 'CC2', '$2b$10$Ys9CxSNzb2QS8FRq..Of3eG2kowa4DNGRDX3fuufzZuEnIRfJblxu', 202),
     (17, 'RegularCook', '$2b$10$2OHgcWW4GqprK5ovD7Y7ZucfGJma.z35R3tFiuqpygntH/3g0S0W2', 201),
     (18, 'CookSupervisor', '$2b$10$fKcaVruqtdprMLbwo.Ad8.3jiLRGymJUYqW8fryEifdRgSS628Bje', 204),
     (19, 'Staff', '$2b$10$m.cIzj8sefC1X/ZOgZhkU.dF0QzOYxwM1UI17/XvLYcmpIUGBJYji', 205),
     (20, 'GeneralUser', '$2b$10$6a5NzeDgLFSSsLbD9X3Iq.C/M0DqSYeRLijIDt9nLBX75COvlSH/6', 5),
     (21, 'Cook', '$2b$10$p8cRiA5uu3BmMU0sllgo9u4LlVFhLkqmzhAfL6uWaP6SSm94kudeK', 201),
     (22, 'ssupervisor', '$2b$10$SL3/vMtGu1.jBksJ4CkHt.SXl0Swi8Dc3km9a3i23gAXz8a5XG1Eq', 204),
     (23, 'Supervisor', '$2b$10$FMQH8Hc/7HD5cfN2DT1vMuhA87j4o67Y1qwvbXOKm8BKJOiLzS7Bq', 204);

INSERT INTO Stores (store_id, name, location, category, availability, rating)
         VALUES
          (1, 'Store1', 'Area1', 'Restaurant', 'Mon-Fri 10am-8pm', 2.93333),
          (2, 'Store2', 'Area51', 'Cycle Repair', 'Mon-Fri 10am-2pm', NULL),
          (3, 'Nescafe', NULL, 'Cafe', 'Sun-Sat 10AM-8PM', NULL),
          (4, 'Cycle store', NULL, 'cycle repair', 'Mon-Fri 8AM-10AM', NULL),
          (5, 'Saras General stores', 'Canteen', 'Stationery', 'Mon-Sat 10AM-7PM', NULL),
          (6, 'Varchas Fruite', 'Sports Area', 'Vegetables and Fruits', 'Sat-Sun 8AM-10AM', NULL),
          (7, 'Kitsons', 'Admin block', 'Cafe', 'Mon-Fri 8AM-12PM', NULL);

INSERT INTO Shopkeepers (SID, name, username, store_id, phone_no, sec_pass_id, sec_pass_exp)
          VALUES
              (1, 'anand', 'admin2', 1, 2312331245, 'S1234', '2022-02-04'),
              (3, 'new', NULL, NULL, NULL, NULL, NULL),
              (4, 'Pratik Kulparti', 'Jack', 2, 2429911234, 'S324', '2022-01-20'),
              (5, 'mandeep ishar', 'CC1', 5, 8909080998, 'S23942', '2021-11-21'),
              (6, 'sheru don', 'Cook', 4, 8009009008, 'S349', '2021-12-02'),
              (7, 'Krishna Tulasi', 'Staff', 3, 7890988907, 'S3485', '2021-11-18');

INSERT INTO License (lic_id, expiry, store_id)
          VALUES
                   ('L0123', '2025-03-04', 1),
                   ('L234', '2029-03-21', 3),
                   ('L292', '2022-04-03', 2),
                   ('L345', '2023-09-20', 4);

INSERT INTO Feedback (feed_id, store_id, service, availability, quality, price, conduct, message)
          VALUES
                        (1, 1, 4, 5, 3, 4, 5, 'Quality of goods can be better.'),
                        (2, 1, 1, 2, 3, 4, 5, NULL),
                        (3, 1, 3, 3, 3, 2, 3, NULL),
                        (4, 1, 1, 1, 1, 1, 1, NULL),
                        (5, 1, 4, 4, 4, 5, 3, NULL),
                        (6, 1, 2, 2, 2, 2, 5, NULL);

INSERT INTO Billrequests (breq_id, paid_amt, tran_id, mode, status, pb_id)
          VALUES
                             (1, 1200, 'T1239', 'Card', 'Accepted', 1),
                             (2, 2400, 'T192391', 'Card', 'In review', 2),
                             (3, 2500, 'T342', 'Cash', 'In review', 4);

INSERT INTO Pendingbills (pb_id, store_id, type_of_service, month_no, due_amt)
          VALUES
              (1, 1, 'Rent', '2020-12-01', 300),
              (2, 2, 'Electricity', '2020-08-09', 4200),
              (3, 2, 'Rent', '2021-12-12', 2000),
              (4, 1, 'Rent', '2020-11-01', 3200);

INSERT INTO License_ext_req (er_id, lic_id, extension_period_days, fee_paid, status, tran_id, mode)
          VALUES
              (2, 'L0123', 3, 2000, 'On hold', 'T1293', 'Card'),
              (3, 'L345', 4, 3000, 'In review', 'T3453', 'Cash'),
              (4, 'L292', 3, 2000, 'Denied', 'T239', 'Cheque');

          
