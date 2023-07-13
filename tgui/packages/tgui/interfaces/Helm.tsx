import { Box } from "../components";
import { Window } from "../layouts";
import { Button, LabeledList, Section } from '../components';

export const Helm = (props, context) => {
  return (

    <Window>
      <Window.Content>
      <Button
        content="Open map"
        onClick={() => act('map')} />
      </Window.Content>
    </Window>
    );
};
