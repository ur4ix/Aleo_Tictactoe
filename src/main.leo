program tictactoe.aleo {

    struct Row {
        c1: u32,
        c2: u32,
        c3: u32
    }

    struct Board {
        r1: Row,
        r2: Row,
        r3: Row,
    }

    transition new() -> Board {
        return Board {
            r1: Row { c1: 0u32, c2: 0u32, c3: 0u32 },
            r2: Row { c1: 0u32, c2: 0u32, c3: 0u32 },
            r3: Row { c1: 0u32, c2: 0u32, c3: 0u32 },
        };
    }

    function check_for_win(b: Board, p: u32) -> bool {
        return
            (b.r1.c1 == p && b.r1.c2 == p && b.r1.c3 == p) || // row 1
            (b.r2.c1 == p && b.r2.c2 == p && b.r2.c3 == p) || // row 2
            (b.r3.c1 == p && b.r3.c3 == p && b.r3.c3 == p) || // row 3
            (b.r1.c1 == p && b.r2.c1 == p && b.r3.c1 == p) || // column 1
            (b.r1.c2 == p && b.r2.c3 == p && b.r3.c2 == p) || // column 2
            (b.r1.c3 == p && b.r2.c3 == p && b.r3.c3 == p) || // column 3
            (b.r1.c1 == p && b.r2.c2 == p && b.r3.c3 == p) || // diagonal
            (b.r1.c3 == p && b.r2.c2 == p && b.r3.c1 == p); // other diagonal
    }

    transition make_move(player: u32, row: u32, col: u32, board: Board) -> (Board, u32) {
        assert(player == 1u32 || player == 2u32);
        assert(1u32 <= row && row <= 3u32);
        assert(1u32 <= col && col <= 3u32);

        let r1c1: u32 = board.r1.c1;
        let r1c2: u32 = board.r1.c2;
        let r1c3: u32 = board.r1.c3;
        let r2c1: u32 = board.r2.c1;
        let r2c2: u32 = board.r2.c2;
        let r2c3: u32 = board.r2.c3;
        let r3c1: u32 = board.r3.c1;
        let r3c2: u32 = board.r3.c2;
        let r3c3: u32 = board.r3.c3;

        if row == 1u32 && col == 1u32 && r1c1 == 0u32 {
            r1c1 = player;
        } else if row == 1u32 && col == 2u32 && r1c2 == 0u32 {
            r1c2 = player;
        } else if row == 1u32 && col == 3u32 && r1c3 == 0u32 {
            r1c3 = player;
        } else if row == 2u32 && col == 1u32 && r2c1 == 0u32 {
            r2c1 = player;
        } else if row == 2u32 && col == 2u32 && r2c2 == 0u32 {
            r2c2 = player;
        } else if row == 2u32 && col == 3u32 && r2c3 == 0u32 {
            r2c3 = player;
        } else if row == 3u32 && col == 1u32 && r3c1 == 0u32 {
            r3c1 = player;
        } else if row == 3u32 && col == 2u32 && r3c2 == 0u32 {
            r3c2 = player;
        } else if row == 3u32 && col == 3u32 && r3c3 == 0u32 {
            r3c3 = player;
        }

        let updated: Board = Board {
            r1: Row { c1: r1c1, c2: r1c2, c3: r1c3 },
            r2: Row { c1: r2c1, c2: r2c2, c3: r2c3 },
            r3: Row { c1: r3c1, c2: r3c2, c3: r3c3 },
        };

        if check_for_win(updated, 1u32) {
            return (updated, 1u32);
        } else if check_for_win(updated, 2u32) {
            return (updated, 2u32);
        } else {
            return (updated, 0u32);
        }
    }
}
